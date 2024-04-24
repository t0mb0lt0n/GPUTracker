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
//        mainVC?.dataChangedCallback = { [ weak self ] newDataSource in
//            //self?.viewModel.selectedDataSource = newDataSource
//        }
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
    
    func changeLabel() {
        
    }
    
    private func setupViewModel() {
        viewModel.reloadClosure = { [weak self] in
            //self?.mainView.itemNameLabel.text = "Label changed"
        }
        viewModel.showLoading = { [weak self] in
            if $0 {
                //self?.mainView.activityIndicator.startAnimating()
            } else {
                //self?.mainView.activityIndicator.stopAnimating()
            }
        }
    }
}

extension ItemDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
        case 0:
            return viewModel.generalSegmentData.count
        case 1:
            print("viewModel.boardsSegmentData.count", viewModel.boardsSegmentData.count)
            return viewModel.boardsSegmentData.count
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
            var cell = UITableViewCell(style: .value1, reuseIdentifier: cellIdentifier)
            cell.textLabel?.font = .systemFont(ofSize: 17, weight: .medium)
            cell.textLabel?.text = viewModel.generalSegmentData[indexPath.row].descriptionName
            cell.detailTextLabel?.text = viewModel.generalSegmentData[indexPath.row].value

            return cell
        case 1:
            let cellIdentifier = "Apple designed cell"
            var cell = UITableViewCell(style: .value1, reuseIdentifier: cellIdentifier)
            cell.textLabel?.font = .systemFont(ofSize: 17, weight: .medium)
            //cell?.textLabel?.text = viewModel.boardsSegmentData.[indexPath.row].hdmi
            cell.detailTextLabel?.text = viewModel.boardsSegmentData[indexPath.row].boardName

            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "ManufacturerCell",
                for: indexPath
            ) as? ManufacturerCell
            else { fatalError() }
            return cell
        }
    }
}



    

