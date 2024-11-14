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
    
    func segmentDidChange() {
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
        setupNavigationBarStyle(
            isLarge: false,
            title: .mainCatalogue,
            titleColor: .black
        )

        mainView.segmentDidChangeClosure = { [weak self] in
            self?.segmentDidChange()
        }
        
        [
        mainView.itemDescriptionView.generalTableView,
        mainView.itemDescriptionView.consoleComponentsTableView,
        mainView.itemDescriptionView.motherboardComponentsTableView
        ].forEach { [weak self] tableView in
            tableView.delegate = self
            tableView.dataSource = self
        }
        
        for (index, value) in viewModel.segmentImages.enumerated() {
//            mainView.segmentedControll.insertSegment(
//                withTitle: value,
//                at: index,
//                animated: false
//            )
            mainView.segmentedControll.insertSegment(
                with: value,
                at: index,
                animated: false
            )
        }
        mainView.segmentedControll.selectedSegmentIndex = viewModel.selectedSegmentIndex
    }
    
    private func setupViewModel() {
        viewModel.reloadClosure = {
            print("reload closure")
            self.mainView.itemDescriptionView.generalTableView.reloadData()
            self.mainView.itemDescriptionView.consoleComponentsTableView.reloadData()
            self.mainView.itemDescriptionView.motherboardComponentsTableView.reloadData()

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
            return viewModel.generalSegmentDataSource.count
        case 1:
            return viewModel.consoleComponentsSegmentDataSource.count
        case 2:
            return viewModel.motherboardComponentsSegmentDataSource.count
        default:
            return 0
        }
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cellIdentifier = "Apple designed cell"
        let defaultCell = UITableViewCell(
            style: .value1,
            reuseIdentifier: cellIdentifier
        )
        defaultCell.textLabel?.font = .systemFont(
            ofSize: Constatnts.fontSize,
            weight: .medium
        )
        guard let generalSegmentTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "\(UniversalCustomCell.self)",
            for: indexPath
        ) as? UniversalCustomCell else {
            fatalError("Cell dequeue error")
        }
        
        guard let consoleComponentsTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "\(UniversalCustomCell.self)",
            for: indexPath
        ) as? UniversalCustomCell else {
            fatalError("Cell dequeue error")
        }
        
        guard let motherboardComponentsTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "\(UniversalCustomCell.self)",
            for: indexPath
        ) as? UniversalCustomCell else {
            fatalError("Cell dequeue error")
        }

        switch tableView.tag {
        case 0:
            generalSegmentTableViewCell.configurateCell(
                descriptionName: viewModel.generalSegmentDataSource[indexPath.row].descriptionName,
                descriptionValue: viewModel.generalSegmentDataSource[indexPath.row].descriptionValue
            )
            return generalSegmentTableViewCell
        case 1:
            consoleComponentsTableViewCell.configurateCell(
                descriptionName: viewModel.consoleComponentsSegmentDataSource[indexPath.row].descriptionName,
                descriptionValue: viewModel.consoleComponentsSegmentDataSource[indexPath.row].descriptionValue
            )
            return consoleComponentsTableViewCell
        case 2:
            motherboardComponentsTableViewCell.configurateCell(
                descriptionName: viewModel.motherboardComponentsSegmentDataSource[indexPath.row].descriptionName,
                descriptionValue: viewModel.motherboardComponentsSegmentDataSource[indexPath.row].descriptionValue
            )
            return motherboardComponentsTableViewCell
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
        title = viewModel.generalSegmentDataSource.last?.descriptionValue
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




    

