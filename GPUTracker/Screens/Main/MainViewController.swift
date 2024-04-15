//
//  ViewController.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit
import RealmSwift

final class MainViewController: UIViewController {
    lazy var mainView = view as! MainView
    var dataChangedCallback: ((Realm) -> Void)?
    
    // Это метод, который будет вызываться, когда вы хотите изменить данные
    func updateDataSource(newDataSource: Realm) {
        // Вызываем замыкание, чтобы передать новые данные
        dataChangedCallback?(newDataSource)
    }
    
    private let viewModel: MainViewModel
    let tableView = UITableView(frame: .zero, style: .grouped)
    let service = RealmService()
    //let fileCreator = RealmFileCreator()
    
    
    init() {
        self.viewModel = MainViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = MainView()
        setupViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "mainVC"
        navigationController?.isNavigationBarHidden = false
        setupTableView()
        tableView.register(
            ManufacturerCell.self,
            forCellReuseIdentifier: "ManufacturerCell"
        )
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        mainView.backgroundColor = .secondarySystemBackground
    }

    private func setupViewModel() {
        viewModel.reloadClosure = {
            
        }
    }
}

//MARK: - MainViewController extensions
extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }
    
    func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        switch section {
        case 0:
            return .microsoft
        case 1:
            return .sony
        default:
            return .placeholderTitle
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
        
        switch section {
        case 0:
            return viewModel.itemsInSection[.microsoft] ?? 0
        case 1:
            return 10
        default:
            return 0
        }
         //manufacturers[section].count
        //service.groupedItems!.table1.count
        //viewModel.numberOfItems
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(
//            withIdentifier: "ManufacturerCell",
//            for: indexPath
//        ) as? ManufacturerCell
//        else { fatalError() }
        
       // cell.textva
//        cell.configurateCell(
//            manufacturer: manufacturers[indexPath.section][indexPath.row]
//        )
        let cellIdentifier = "Cell" // Ваш идентификатор ячейки
           var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
           
           if cell == nil {
               cell = UITableViewCell(style: .value1, reuseIdentifier: cellIdentifier)
           }
        cell?.textLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        cell?.textLabel?.text = "Заголовок"
        cell?.detailTextLabel?.text = "Дополнительная информация"

        
        
        return cell!
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
            manufacturerNameLabel.text = .microsoft
        case 1:
            manufacturerNameLabel.text = .sony
        default:
            return nil
        }
        return customHeaderView
    }
}

extension MainViewController: UITableViewDelegate {
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
            let newRealm = RealmService.shared.realms[indexPath.row]
            updateDataSource(newDataSource: newRealm)

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



    
extension MainViewController {
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
