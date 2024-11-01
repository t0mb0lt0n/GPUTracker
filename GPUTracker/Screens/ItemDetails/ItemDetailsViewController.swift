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
       // setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = ItemDetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.segmentDidChangeClosure = { [weak self] in
            self?.segmentDidChange()
        }
        setupMainView()
        setupViewModel()
        viewModel.loadSelectedData()
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
        [
        mainView.itemDescriptionView.generalSegmentTableView,
        mainView.itemDescriptionView.motherBoardsSegmentTableView
        ].forEach { [weak self] tableView in
            tableView.delegate = self
            tableView.dataSource = self
        }
        
        for (index, value) in viewModel.descriptionSegments.enumerated() {
            mainView.segmentedControll.insertSegment(
                withTitle: value,
                at: index,
                animated: false
            )
        }
        mainView.segmentedControll.selectedSegmentIndex = viewModel.selectedSegmentIndex
    }
    
    private func setupViewModel() {
        viewModel.reloadClosure = { 
//            self?.mainView.itemDescriptionView.generalSegmentTableView.reloadData()
//            self?.mainView.itemDescriptionView.motherBoardsSegmentTableView.reloadData()
            print("reloaded")
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
            return viewModel.generalSegmentRealmData.count
        case 1:
            return viewModel.boardsSegmentRealmData.count
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
        guard let boardsSegmentTableViewCell = tableView.dequeueReusableCell(
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
            generalSegmentTableViewCell.descriptionNameLabel.text = viewModel.generalSegmentRealmData[indexPath.row].descriptionName
            generalSegmentTableViewCell.descriptionValueTextView.text = viewModel.generalSegmentRealmData[indexPath.row].value
            return generalSegmentTableViewCell
        case 1:
            boardsSegmentTableViewCell.descriptionNameLabel.text = viewModel.boardsSegmentRealmData[indexPath.row].boardName
            boardsSegmentTableViewCell.descriptionValueTextView.text = viewModel.boardsSegmentRealmData[indexPath.row].revison
            return boardsSegmentTableViewCell
        default:
            return boardsSegmentTableViewCell
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
    func updateData(forItemIndex itemIndexName: String) {
        print("Delegate")
        viewModel.currentRealm = RealmService(
            withRealmName: itemIndexName
        ).data
        viewModel.loadSelectedData()
        //mainView.itemDescriptionView.generalSegmentTableView.reloadData()
        //mainView.itemDescriptionView.motherBoardsSegmentTableView.reloadData()
    }
}




    

