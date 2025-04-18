//
//  ViewController.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit
import Realm

protocol RealmUpdateDelegate: AnyObject {
    func updateData(forItemWithName itemIndexName: String)
}

final class MainCatalogueViewController: UIViewController {
    private lazy var mainView = view as! MainCatalogueView
    private let viewModel: MainCatalogueViewModel
    private weak var delegate: RealmUpdateDelegate?
    
    init() {
        viewModel = MainCatalogueViewModel(
            withService: .init(
                withRealmName: .mainProductList
            )
        )
        super.init(nibName: nil, bundle: nil)
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = MainCatalogueView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupNavigationBarStyle(
            isLarge: true,
            title: .mainCatalogue,
            titleColor: .black,
            backBarButtonTitle: .mainCatalogue
        )
    }
    
    override func viewDidLayoutSubviews() {
        viewModel.updateData()
    }
    
    private func setupNavigationBarStyle(
        isLarge: Bool,
        title: String?,
        titleColor: UIColor?,
        backBarButtonTitle: String?
    ) {
        navigationController?.navigationBar.prefersLargeTitles = isLarge
        guard
            let title,
            let titleColor
        else
        { return }
        self.title = title
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: titleColor
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: titleColor
        ]
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(
            title: backBarButtonTitle,
            style: .plain,
            target: nil,
            action: nil
        )
        navigationController?.navigationBar.tintColor = titleColor
        navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor = .systemBlue
    }
    
    private func setupMainView() {
        mainView.setupMainCatalogueTableView(
            withDelegate: self,
            andDataSource: self
        )
        mainView.backgroundColor = .tertiarySystemGroupedBackground
        let infoButton: UIBarButtonItem = {
            let button = UIBarButtonItem(
                image: .infoButtonImage,
                style: .done,
                target: self,
                action: #selector(infoButtonTapped)
            )
            return button
        }()
        navigationItem.rightBarButtonItem = infoButton
    }

    private func setupViewModel() {
        viewModel.reloadClosure = { [weak self] in
            self?.reloadTableView()
        }
    }
    
    private func reloadTableView() {
        mainView.mainCatalogueTableViewReloadData()
    }
    
    @objc private func infoButtonTapped() {
        let infoViewController = InfoViewController()
        let screenHeight = UIScreen.main.bounds.height
        
        if let sheet = infoViewController.sheetPresentationController {
            sheet.largestUndimmedDetentIdentifier = nil
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            sheet.prefersGrabberVisible = true
            guard screenHeight > Constants.screenHeightRequared else {
                sheet.detents = [.large()]
                navigationController?.present(infoViewController, animated: true)
                return
            }
            sheet.detents = [.medium()]
            navigationController?.present(infoViewController, animated: true)
        }
    }
}

//MARK: - UITableViewDataSource
extension MainCatalogueViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForFooterInSection section: Int
    ) -> UIView? {
        let footerPadding = UIView()
        footerPadding.backgroundColor = .systemGreen
        return footerPadding
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        switch section {
        case 0:
            return viewModel.microsoftSectionDataSource?.count ?? Constants.defaultNumberOfRowsInSection
        case 1:
            return viewModel.sonySectionDataSource?.count ?? Constants.defaultNumberOfRowsInSection
        case 2:
            return viewModel.segaSectionDataSource?.count ?? Constants.defaultNumberOfRowsInSection
        default:
            return 0
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainCatalogueTableViewCell.defaultIdentifier,
            for: indexPath
        ) as? MainCatalogueTableViewCell else {
            assertionFailure(.cellError)
            return UITableViewCell()
        }
        cell.selectionStyle = .default
        cell.accessoryType = .disclosureIndicator
        switch indexPath.section {
        case 0:
            if let microsoftData = viewModel.microsoftSectionDataSource?[safe: indexPath.row] {
                cell.setupCellSubviews(
                    descriptionName: microsoftData.productName,
                    descriptionValue: microsoftData.shortDetails,
                    onlineStatus: microsoftData.onlineStatus
                )
            } else {
                cell.setupCellSubviewsSafe()
            }
        case 1:
            if let sonyData = viewModel.sonySectionDataSource?[safe: indexPath.row] {
                cell.setupCellSubviews(
                    descriptionName: sonyData.productName,
                    descriptionValue: sonyData.shortDetails,
                    onlineStatus: sonyData.onlineStatus
                )
            } else {
                cell.setupCellSubviewsSafe()
            }
        case 2:
            if let segaData = viewModel.segaSectionDataSource?[safe: indexPath.row] {
                cell.setupCellSubviews(
                    descriptionName: segaData.productName,
                    descriptionValue: segaData.shortDetails,
                    onlineStatus: segaData.onlineStatus
                )
            } else {
                cell.setupCellSubviewsSafe()
            }
        default:
            cell.setupCellSubviewsSafe()
        }
        return cell
    }
    
    //setup header height in section
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        Constants.heightForHeaderInSection
    }
    //setup footer height in section
    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        Constants.heightForFooterInSection
    }
    //custom headerView
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let customHeaderView = UIView()
        let developerNameLabel = UILabel(
            frame: CGRect(
                x: Constants.sectionNameLabelXAxis,
                y: Constants.sectionNameLabelYAxis,
                width: Constants.sectionNameLabelWidth,
                height: Constants.sectionNameLabelHeight
            )
        )
        developerNameLabel.textColor = .systemGray
        customHeaderView.addSubview(developerNameLabel)
        
        switch section {
        case let sectionNumber:
            if let developerName = viewModel.developerListDataSource?[safe: sectionNumber]?.developerName {
                developerNameLabel.text = developerName
            } else {
                developerNameLabel.text = .defaultDeveloperName
            }
        }
        return customHeaderView
    }
}

//MARK: - UITableViewDelegate
extension MainCatalogueViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let itemDetailsVC = ItemDetailsViewController(
            withViewModel: .init(),
            andBarTitle: .playstation3
        )
        delegate = itemDetailsVC
        
        switch indexPath.section {
        case let sectionNumber:
            if let itemName = RealmConfiguration.itemList[safe: sectionNumber]?[safe: indexPath.row] {
                self.delegate?.updateData(
                    forItemWithName: itemName
                )
                navigationController?.pushViewController(itemDetailsVC, animated: true)
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MainCatalogueViewController {
    private enum Constants {
        static let defaultNumberOfRowsInSection: Int = 0
        static let sectionNameLabelXAxis: Int = 20
        static let sectionNameLabelYAxis: Int = 20
        static let sectionNameLabelBaseLeadingOffset: Int = 20
        static let sectionNameLabelWidth: Int = Int(UIScreen.main.bounds.width) - 2 * (sectionNameLabelXAxis + sectionNameLabelBaseLeadingOffset)
        static let sectionNameLabelHeight: Int = 23
        static let heightForFooterInSection: CGFloat = 0.0
        static let heightForHeaderInSection: CGFloat = 50.0
        static let screenHeightRequared: CGFloat = 736.0
    }
}
