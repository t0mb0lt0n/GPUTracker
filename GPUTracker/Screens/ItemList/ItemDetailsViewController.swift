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
    let service = RealmService()
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
            print("1")
            //anyObject.get_cuntry_by_id(id: array_of_cities[indexPath.row].id)[indexPath.row].name
            return viewModel.dataSourceForGeneral.count
        case 1:
            print("2")
            return 100
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
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "GeneralCell",
                for: indexPath
            ) as? GeneralCell
            else { fatalError() }
            
            cell.configurateCell(
                descriptionName: viewModel.dataSourceForGeneral[indexPath.row].descriptionName,
                descriptionValue: viewModel.dataSourceForGeneral[indexPath.row].descriptionValue1
            )
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "MotherboardCell",
                for: indexPath
            ) as? MotherboardCell
            else { fatalError() }
//            let descriptionName = viewModel.dataSource?.objects(ProductList.self)
//            cell.configurateCell(
//                descriptionName: viewModel.selectedDataSource.objects(ProductList.self)[indexPath.row].name,
//                descriptionValue: viewModel.selectedDataSource.objects(ProductList.self)[indexPath.row].name
//            )
//            cell.configurateCell(
//                descriptionName: viewModel.dataSourceForGeneral[indexPath.row].name,
//                descriptionValue: viewModel.dataSourceForGeneral[indexPath.row].shortDescription
//            )
            
            cell.configurateCell(boardName: "Falcon", revision: "Fat", gpu: "Y2 Rhea 90nm", cpu: "Xcpu", isHdmi: "true")

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



    

