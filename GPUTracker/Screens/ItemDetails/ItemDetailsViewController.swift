//
//  ItemListViewController.swift
//  GPUTracker
//
//  Created by Alexander on 04.04.2024.
//

import UIKit
import RealmSwift

final class ItemDetailsViewController: UIViewController {
    lazy var mainView = view as! ItemDetailsView
    private let viewModel: ItemDetailsViewModel
    
    init(
        withViewModel viewModel: ItemDetailsViewModel,
        andBarTitle barTitle: String
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = barTitle
        setupViewModel()
        print("init ItemDetailsViewController")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit ItemDetailsViewController")
    }
    
    override func loadView() {
        view = ItemDetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
    }
    
    private func segmentDidChange() {
        let contentOffset = Int(
            mainView.itemDescriptionView.generalTableView.frame.width
        )
        let segmentIndex = mainView.segmentedControll.selectedSegmentIndex
        mainView.itemDescriptionView.mainScrollView.setContentOffset(
            CGPoint(
                x: contentOffset * segmentIndex,
                y: Constatnts.segmentedControlSelectionOffsetYAxis
            ),
            animated: true
        )
    }
    
    private func setupMainView() {
        mainView.segmentDidChangeClosure = { [weak self] in
            self?.segmentDidChange()
        }
        
        [
        mainView.itemDescriptionView.generalTableView,
        mainView.itemDescriptionView.consoleComponentsTableView,
        mainView.itemDescriptionView.motherboardComponentsTableView,
        mainView.itemDescriptionView.controllersTableView
        ].forEach { [weak self] tableView in
            tableView.delegate = self
            tableView.dataSource = self
        }
        
        for (index, value) in viewModel.segmentImages.enumerated() {
            mainView.segmentedControll.insertSegment(
                with: value,
                at: index,
                animated: false
            )
        }
        mainView.segmentedControll.selectedSegmentIndex = viewModel.initialSegmentIndex
    }
    
    private func setupViewModel() {
        viewModel.reloadClosure = { [weak self] in
            guard let self else { return }
            print("reload closure")
            self.mainView.itemDescriptionView.generalTableView.reloadData()
            self.title = self.viewModel.generalDataSource.last?.descriptionValue
            self.mainView.itemDescriptionView.consoleComponentsTableView.reloadData()
            self.mainView.itemDescriptionView.motherboardComponentsTableView.reloadData()
            self.mainView.itemDescriptionView.controllersTableView.reloadData()
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
            return viewModel.generalDataSource.count
        case 1:
            return viewModel.consoleComponentsDataSource.count
        case 2:
            return viewModel.motherboardComponentsDataSource.count
        case 3:
            return viewModel.controllersDataSource.count
        default:
            return 0
        }
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let defaultCell = UITableViewCell(
            style: .value1,
            reuseIdentifier: "Apple designed cell"
        )
        
        guard let generalSegmentTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "\(UniversalCustomCell.self)",
            for: indexPath
        ) as? UniversalCustomCell else {
            fatalError(.cellError)
        }
        
        guard let consoleComponentsTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "\(UniversalCustomCell.self)",
            for: indexPath
        ) as? UniversalCustomCell else {
            fatalError(.cellError)
        }
        
        guard let motherboardComponentsTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "\(UniversalCustomCell.self)",
            for: indexPath
        ) as? UniversalCustomCell else {
            fatalError(.cellError)
        }
        
        guard let controllersTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "\(UniversalCustomCell.self)",
            for: indexPath
        ) as? UniversalCustomCell else {
            fatalError(.cellError)
        }

        switch tableView.tag {
        case 0:
            generalSegmentTableViewCell.configurateCell(
                descriptionName: viewModel.generalDataSource[indexPath.row].descriptionName,
                descriptionValue: viewModel.generalDataSource[indexPath.row].descriptionValue
            )
            return generalSegmentTableViewCell
        case 1:
            consoleComponentsTableViewCell.configurateCell(
                descriptionName: viewModel.consoleComponentsDataSource[indexPath.row].descriptionName,
                descriptionValue: viewModel.consoleComponentsDataSource[indexPath.row].descriptionValue
            )
            return consoleComponentsTableViewCell
        case 2:
            motherboardComponentsTableViewCell.configurateCell(
                descriptionName: viewModel.motherboardComponentsDataSource[indexPath.row].descriptionName,
                descriptionValue: viewModel.motherboardComponentsDataSource[indexPath.row].descriptionValue
            )
            return motherboardComponentsTableViewCell
        case 3:
            controllersTableViewCell.configurateCell(
                descriptionName: viewModel.controllersDataSource[indexPath.row].descriptionName,
                descriptionValue: viewModel.controllersDataSource[indexPath.row].descriptionValue
            )
            return controllersTableViewCell
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
        print("Delegate")
        title = viewModel.generalDataSource.last?.descriptionValue
        viewModel.currentRealm = RealmService(
            withRealmName: itemName
        ).data
    }
}

extension ItemDetailsViewController {
    private enum Constatnts {
        static let segmentedControlSelectionOffsetYAxis: Int = 0
        static let fontSize: CGFloat = 17
    }
}




    

