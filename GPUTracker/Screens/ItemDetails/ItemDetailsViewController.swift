//
//  ItemListViewController.swift
//  GPUTracker
//
//  Created by Alexander on 04.04.2024.
//

import UIKit
import RealmSwift

final class ItemDetailsViewController: UIViewController {
    var mainVC: MainViewController?
    lazy var mainView = view as! ItemDetailsView
    private let viewModel: ItemDetailsViewModel
    
    init(viewModel: ItemDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = ItemDetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = .productDetailsHeader
        navigationController?.isNavigationBarHidden = false
        mainView.segmentDidChangedClosure = { [weak self] in
            self?.segmentChanged()
        }
        setupViewModel()
        setupMainView()
    }
    
    func segmentChanged() {
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
        viewModel.reloadClosure = { [weak self] in
            self?.mainView.itemDescriptionView.generalSegmentTableView.reloadData()
            self?.mainView.itemDescriptionView.motherBoardsSegmentTableView.reloadData()
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
        let cell = UITableViewCell(
            style: .value1,
            reuseIdentifier: cellIdentifier
        )
        cell.textLabel?.font = .systemFont(
            ofSize: 17,
            weight: .medium
        )
        switch tableView.tag {
        case 0:
            cell.textLabel?.text = viewModel.generalSegmentRealmData[indexPath.row].descriptionName
            cell.detailTextLabel?.text = viewModel.generalSegmentRealmData[indexPath.row].value
            return cell
        case 1:
            cell.detailTextLabel?.text = viewModel.boardsSegmentRealmData[indexPath.row].boardName
            return cell
        default:
            return cell
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
        viewModel.currentRealm = RealmService(
            withRealmName: itemIndexName
        ).data
        mainView.itemNameLabel.text = "Text has changed"
        mainView.itemImageView.image = UIImage(named: itemIndexName)
    }
}




    

