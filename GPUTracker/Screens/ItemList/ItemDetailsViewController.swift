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
        title = "Item List"
        navigationController?.isNavigationBarHidden = false
        mainView.segmentDidChangedClosure = { [weak self] in
            self?.segmentChanged()
        }
        setupViewModel()
        setupMainView()
    }
    
    func segmentChanged() {
        let contentOffset = Int(mainView.itemDescriptionView.generalSegmentTableView.frame.width)
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
        mainView.itemDescriptionView.generalSegmentTableView.dataSource = self
        mainView.itemDescriptionView.motherBoardsSegmentTableView.dataSource = self
        
        for (index, value) in viewModel.descriptionSegments.enumerated() {
            mainView.segmentedControll.insertSegment(
                withTitle: value,
                at: index,
                animated: false
            )
        }
        mainView.segmentedControll.selectedSegmentIndex = 0
    }
    
    
    private func setupViewModel() {
        viewModel.reloadClosure = { [weak self] in
            self?.mainView.itemDescriptionView.generalSegmentTableView.reloadData()
            self?.mainView.itemDescriptionView.motherBoardsSegmentTableView.reloadData()
        }
    }
}

extension ItemDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
        case 0:
            return viewModel.generalSegmentRealmData.count
        case 1:
            print("viewModel.boardsSegmentData.count", viewModel.boardsSegmentRealmData.count)
            return viewModel.boardsSegmentRealmData.count
        default:
            return 0
        }
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        switch tableView.tag {
        case 0:
            let cellIdentifier = "Apple designed cell"
            let cell = UITableViewCell(style: .value1, reuseIdentifier: cellIdentifier)
            cell.textLabel?.font = .systemFont(ofSize: 17, weight: .medium)
            cell.textLabel?.text = viewModel.generalSegmentRealmData[indexPath.row].descriptionName
            cell.detailTextLabel?.text = viewModel.generalSegmentRealmData[indexPath.row].value

            return cell
        case 1:
            let cellIdentifier = "Apple designed cell"
            var cell = UITableViewCell(style: .value1, reuseIdentifier: cellIdentifier)
            cell.textLabel?.font = .systemFont(ofSize: 17, weight: .medium)
            cell.detailTextLabel?.text = viewModel.boardsSegmentRealmData[indexPath.row].boardName

            return cell
        default:
            let cellIdentifier = "Apple designed cell"
            let cell = UITableViewCell(style: .value1, reuseIdentifier: cellIdentifier)
            return cell
        }
    }
}

extension ItemDetailsViewController: UpdateRealmDelegate {
    func updateData(forRealmName realmName: String, withItemImage itemImage: UIImage) {
        viewModel.currentRealm = RealmService(withRealmName: realmName).data
        mainView.itemNameLabel.text = "text has changed"
        mainView.itemImageView.image = itemImage
    }
}




    

