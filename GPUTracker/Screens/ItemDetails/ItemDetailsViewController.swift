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
            mainView.itemDescriptionView.generalSegmentTableView.frame.width
        )
        let segmentIndex = mainView.segmentedControll.selectedSegmentIndex
        mainView.itemDescriptionView.mainScrollView.setContentOffset(
            CGPoint(
                x: contentOffset * segmentIndex,
                y: 0
            ),
            animated: true
        )
    }
    
    private func setupMainView() {
        mainView.segmentDidChangeClosure = { [weak self] in
            self?.segmentDidChange()
        }
        
        [
        mainView.itemDescriptionView.generalSegmentTableView,
        mainView.itemDescriptionView.motherBoardsSegmentTableView
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
            self.mainView.itemDescriptionView.generalSegmentTableView.reloadData()
            self.mainView.itemDescriptionView.motherBoardsSegmentTableView.reloadData()
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
            ofSize: 17,
            weight: .medium
        )
        guard let componentsSegmentTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "\(UniversalCustomCell.self)",
            for: indexPath
        ) as? UniversalCustomCell else {
            fatalError("Cell dequeue error")
        }
        
        guard let generalSegmentTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "\(UniversalCustomCell.self)",
            for: indexPath
        ) as? UniversalCustomCell else {
            fatalError("Cell dequeue error")
        }

        switch tableView.tag {
        case 0:
            generalSegmentTableViewCell.descriptionNameLabel.text = viewModel.generalSegmentDataSource[indexPath.row].descriptionName
            generalSegmentTableViewCell.descriptionValueTextView.text = viewModel.generalSegmentDataSource[indexPath.row].descriptionValue
            return generalSegmentTableViewCell
        case 1:
            componentsSegmentTableViewCell.descriptionNameLabel.text = viewModel.consoleComponentsSegmentDataSource[indexPath.row].descriptionName
            componentsSegmentTableViewCell.descriptionValueTextView.text = viewModel.consoleComponentsSegmentDataSource[indexPath.row].descriptionValue
            return componentsSegmentTableViewCell
        case 2:
            componentsSegmentTableViewCell.descriptionNameLabel.text = viewModel.motherboardComponentsSegmentDataSource[indexPath.row].descriptionName
            componentsSegmentTableViewCell.descriptionValueTextView.text = viewModel.motherboardComponentsSegmentDataSource[indexPath.row].descriptionValue
            return componentsSegmentTableViewCell
        default:
            return componentsSegmentTableViewCell
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




    

