//
//  ItemListViewController.swift
//  GPUTracker
//
//  Created by Alexander on 04.04.2024.
//

import UIKit

final class ItemDetailsViewController: UIViewController {
    private lazy var mainView = view as! ItemDetailsView
    private let viewModel: ItemDetailsViewModel
    
    private enum Constants {
        static let fontSize: CGFloat = 17.0
        static let defaultNumberOfRowsInSection: Int = 0
    }
    
    init(
        withViewModel viewModel: ItemDetailsViewModel,
        andBarTitle barTitle: String
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = barTitle
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = ItemDetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
    }
    
    private func setupMainView() {
        mainView.setupItemDescriptionViewTableViews(
            withDelegate: self,
            andDataSource: self
        )
        
        mainView.setupSegmentedControl(
            with: viewModel.segmentImages,
            andInitialIndex: viewModel.initialSegmentIndex
        )
    }
    
    private func setupViewModel() {
        viewModel.reloadClosure = { [weak self] in
            guard let self else { return }
            self.title = self.viewModel.generalDataSource?.last?.descriptionValue ?? .defaultPageTitle
            self.mainView.itemDescriptionViewTableViewsReloadData()
        }
    }
}

//MARK: - UITableViewDataSource
extension ItemDetailsViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        switch tableView.tag {
        case 0:
            return viewModel.generalDataSource?.count ?? Constants.defaultNumberOfRowsInSection
        case 1:
            return viewModel.consoleComponentsDataSource?.count ?? Constants.defaultNumberOfRowsInSection
        case 2:
            return viewModel.motherboardComponentsDataSource?.count ?? Constants.defaultNumberOfRowsInSection
        case 3:
            return viewModel.controllersDataSource?.count ?? Constants.defaultNumberOfRowsInSection
        default:
            return Constants.defaultNumberOfRowsInSection
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let defaultCell = UITableViewCell(
            style: .value1,
            reuseIdentifier: .appleBasicCellID
        )
        
        guard let generalSegmentTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: BasicTableViewCell.defaultIdentifier,
            for: indexPath
        ) as? BasicTableViewCell else {
            assertionFailure(.cellError)
            return UITableViewCell()
        }
        
        guard let consoleComponentsTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: BasicTableViewCell.defaultIdentifier,
            for: indexPath
        ) as? BasicTableViewCell else {
            assertionFailure(.cellError)
            return UITableViewCell()
        }
        
        guard let motherboardComponentsTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: BasicTableViewCell.defaultIdentifier,
            for: indexPath
        ) as? BasicTableViewCell else {
            assertionFailure(.cellError)
            return UITableViewCell()
        }
        
        guard let controllersTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: BasicTableViewCell.defaultIdentifier,
            for: indexPath
        ) as? BasicTableViewCell else {
            assertionFailure(.cellError)
            return UITableViewCell()
        }
        
        switch tableView.tag {
        case 0:
            if let generalData = viewModel.generalDataSource?[safe: indexPath.row] {
                generalSegmentTableViewCell.setupCellSubviews(
                    descriptionName: generalData.descriptionName,
                    descriptionValue: generalData.descriptionValue
                )
                return generalSegmentTableViewCell
            } else {
                return defaultCell
            }
        case 1:
            if let consoleComponentsData = viewModel.consoleComponentsDataSource?[safe: indexPath.row] {
                consoleComponentsTableViewCell.setupCellSubviews(
                    descriptionName: consoleComponentsData.descriptionName,
                    descriptionValue: consoleComponentsData.descriptionValue
                )
                return consoleComponentsTableViewCell
            } else {
                return defaultCell
            }
        case 2:
            if let motherboardComponentsData = viewModel.motherboardComponentsDataSource?[safe: indexPath.row] {
                motherboardComponentsTableViewCell.setupCellSubviews(
                    descriptionName: motherboardComponentsData.descriptionName,
                    descriptionValue: motherboardComponentsData.descriptionValue
                )
                return motherboardComponentsTableViewCell
            } else {
                return defaultCell
            }
        case 3:
            if let controllersData = viewModel.controllersDataSource?[safe: indexPath.row] {
                controllersTableViewCell.setupCellSubviews(
                    descriptionName: controllersData.descriptionName,
                    descriptionValue: controllersData.descriptionValue
                )
                return controllersTableViewCell
            } else {
                return defaultCell
            }
        default:
            return defaultCell
        }
    }
}

//MARK: - UITableViewDelegate
extension ItemDetailsViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ItemDetailsViewController: RealmUpdateDelegate {
    func updateData(forItemWithName itemName: String) {
        title = viewModel.generalDataSource?.last?.descriptionValue ?? .defaultPageTitle
        viewModel.currentRealm = RealmService(
            withRealmName: itemName
        ).data
    }
}
