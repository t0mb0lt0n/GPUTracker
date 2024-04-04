//
//  ItemListViewController.swift
//  GPUTracker
//
//  Created by Alexander on 04.04.2024.
//

import UIKit
import RealmSwift

final class ItemListViewController: UIViewController {
    lazy var mainView = view as! ItemListView
    //let manufacturers = Source.generateManufacturersWithGroups()
    let tableView = UITableView(frame: .zero, style: .grouped)
    let service = RealmService()
    //let fileCreator = RealmFileCreator()
    
    override func loadView() {
        view = ItemListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Item List"
        navigationController?.isNavigationBarHidden = false
        setupTableView()
        tableView.register(
            ManufacturerCell.self,
            forCellReuseIdentifier: "ManufacturerCell"
        )
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.isHidden = true
        mainView.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .black
    }
}

//MARK: - MainViewController extensions
extension ItemListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        switch section {
        case 0:
            return "Nvidia"
        case 1:
            return "AMD"
        default:
            return "not found"
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForFooterInSection section: Int
    ) -> UIView? {
        let footerPadding = UIView()
        footerPadding.backgroundColor = .systemGreen
        return footerPadding
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        // manufacturers[section].count
        //service.groupedItems!.table1.count
        2
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ManufacturerCell",
            for: indexPath
        ) as? ManufacturerCell
        else { fatalError() }
        
//        cell.configurateCell(
//            manufacturer: manufacturers[indexPath.section][indexPath.row]
//        )
        return cell
    }
    //setup header in section height
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        50
    }
    //setup footer in section height
    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        0
    }
    
    //custom header view for table view
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let customHeaderView = UIView()
        let manufacturerNameLabel = UILabel(
            frame: CGRect(
                x: 5,
                y: 20,
                width: 150,
                height: 15
            )
        )
        manufacturerNameLabel.textColor = .black
        manufacturerNameLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        customHeaderView.addSubview(manufacturerNameLabel)
        
        switch section {
        case 0:
            manufacturerNameLabel.text = "nvidia"
        case 1:
            manufacturerNameLabel.text = "AMD"
        default:
            return nil
        }
        return customHeaderView
    }
}
    
//extension MainViewController: UITableViewDelegate {
//    func tableView(
//        _ tableView: UITableView,
//        didSelectRowAt indexPath: IndexPath
//    ) {
//        switch indexPath.section {
//        case 0:
//            let targetVC = GPUListViewController(selectedVendor: "Nvidia")
//            print("hjkhkj")
//            navigationController?.pushViewController(targetVC, animated: true)
//        case 1:
//            let targetVC = GPUListViewController(selectedVendor: "AMD")
//            navigationController?.pushViewController(targetVC, animated: true)
//        default:
//            break
//        }
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//}

extension ItemListViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        switch indexPath.section {
        case 0:
//            let targetVC = GPUListViewController(selectedVendor: "Nvidia")
//            navigationController?.pushViewController(targetVC, animated: true)
            //let testDB = RealmService(vendor: "test", itemName: "test", count: 1)
            //let testrecord = RealmService(vendor: "tes2", itemName: "tes2", count: 2)
            print("saved")
            

        case 1:
//            let targetVC = GPUListViewController(selectedVendor: "AMD")
//            navigationController?.pushViewController(targetVC, animated: true)
            print("saved")
                    default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
    
extension ItemListViewController {
    private func setupTableView() {
        mainView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 150
            ),
            tableView.leadingAnchor.constraint(
                equalTo: mainView.safeAreaLayoutGuide.leadingAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: mainView.trailingAnchor
            ),
            tableView.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
