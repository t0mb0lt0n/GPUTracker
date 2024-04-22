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
    //let service = RealmService()
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
        let contentOffset = mainView.itemDescriptionView.generalSegmentTableView.frame.width
        let segmentIndex = mainView.segmentedControll.selectedSegmentIndex
        mainView.itemDescriptionView.mainScrollView.setContentOffset(CGPoint(x: Int(contentOffset) * segmentIndex, y: 0), animated: true)
    }
    
    private func setupMainView() {
        mainView.itemDescriptionView.generalSegmentTableView.dataSource = self
        mainView.itemDescriptionView.motherBoardsSegmentTableView.dataSource = self
        mainView.segmentedControll.selectedSegmentIndex = 0
        for (index, value) in viewModel.descriptionSegments.enumerated() {
            mainView.segmentedControll.insertSegment(withTitle: value, at: index, animated: false)
        }
        mainView.segmentedControll.selectedSegmentIndex = 0
    }
    
    private func setupViewModel() {
        viewModel.reloadClosure = { [weak self] in
            self?.mainView.itemDescriptionView.generalSegmentTableView.reloadData()
            self?.mainView.itemDescriptionView.generalSegmentTableView.reloadData()
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
            let cellIdentifier = "Cell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            
            if cell == nil {
                cell = UITableViewCell(style: .value1, reuseIdentifier: cellIdentifier)
            }
            cell?.textLabel?.font = .systemFont(ofSize: 17, weight: .medium)
            cell?.textLabel?.text = viewModel.generalSegmentData[indexPath.row].descriptionName
            cell?.detailTextLabel?.text = viewModel.generalSegmentData[indexPath.row].value

            return cell!
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "MotherboardCell",
                for: indexPath
            ) as? MotherboardCell
            else { fatalError() }
            
            let name = viewModel.boardsSegmentData[indexPath.row].boardName
            let value = viewModel.boardsSegmentData[indexPath.row].value

            cell.configurateCell(
                descriptionHeader: name,
                boardName: name,
                revision: value,
                gpu: value,
                cpu: value,
                isHdmi: value
            )

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



    

