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
    }
    
    override func viewDidLayoutSubviews() {
        viewModel.updateData()
    }
    
    private func setupMainView() {
        mainView.mainCatalogueTableView.delegate = self
        mainView.mainCatalogueTableView.dataSource = self
        mainView.backgroundColor = .tertiarySystemGroupedBackground
        setupNavigationBarStyle(
            isLarge: true,
            title: .mainCatalogue,
            titleColor: .black,
            backBarButtonTitle: .mainCatalogue
        )
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
        mainView.mainCatalogueTableView.reloadData()
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
            guard screenHeight >= Constants.screenHeightRequared else {
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
            cell.setupCellSubviews(
                descriptionName: viewModel.microsoftSectionDataSource?[indexPath.row].productName,
                descriptionValue: viewModel.microsoftSectionDataSource[indexPath.row].shortDetails,
                onlineStatus: viewModel.microsoftSectionDataSource[indexPath.row].onlineStatus
            )
        case 1:
            cell.setupCellSubviews(
                descriptionName: viewModel.sonySectionDataSource[indexPath.row].productName,
                descriptionValue: viewModel.sonySectionDataSource[indexPath.row].shortDetails,
                onlineStatus: viewModel.sonySectionDataSource[indexPath.row].onlineStatus
            )
        case 2:
            cell.setupCellSubviews(
                descriptionName: viewModel.segaSectionDataSource[indexPath.row].productName,
                descriptionValue: viewModel.segaSectionDataSource[indexPath.row].shortDetails,
                onlineStatus: viewModel.segaSectionDataSource[indexPath.row].onlineStatus
            )
        default:
            cell.setupCellSubviewsSafe()
        }
        return cell
    }
    
    //setup height for header in section
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        Constants.heightForHeaderInSection
    }
    //setup height for footer in section
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
            developerNameLabel.text = viewModel.developerListDataSource[sectionNumber].developerName
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
            withViewModel: .init(
                forItemWithRealmName: .playstation3
            ),
            andBarTitle: .playstation3
        )
        delegate = itemDetailsVC
        
        switch indexPath.section {
        case let sectionNumber:
            self.delegate?.updateData(
                forItemWithName: RealmConfiguration.itemList[sectionNumber][indexPath.row]
            )
            navigationController?.pushViewController(itemDetailsVC, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(
        _ tableView: UITableView,
        accessoryButtonTappedForRowWith indexPath: IndexPath
    ) {
        switch indexPath.section {
        case let sectionNumber:
            delegate?.updateData(
                forItemWithName: RealmConfiguration.itemList[sectionNumber][indexPath.row]
            )
        }
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
        static let screenHeightRequared: CGFloat = 668.0
    }
}
