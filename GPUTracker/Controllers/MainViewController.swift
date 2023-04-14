//
//  ViewController.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    lazy var mainView = view as? MainView
    let vendors = Source.generateVendors()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemFill
        view = MainView()
        setupTableView()
        tableView.register(VendorCellView.self, forCellReuseIdentifier: "VendorCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.sectionHeaderHeight = 50
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            let nvidiaHeader: String = "Nvidia"
            return nvidiaHeader
        case 1:
            return "AMD"
        default:
            return "not found"
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vendors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VendorCell", for: indexPath) as? VendorCellView
        else { fatalError() }
        
        cell.configurateCell(vendor: vendors[indexPath.row])
        return cell
    }
}
    
extension MainViewController: UITableViewDelegate {
    
}
    
extension MainViewController {
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: mainView!.processorsLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
}
