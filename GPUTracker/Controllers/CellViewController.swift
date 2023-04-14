//
//  CellViewController.swift
//  GPUTracker
//
//  Created by Alexander on 14.04.2023.
//

import UIKit

class CellViewController: UIViewController {
    let vendors = Source.generateVendors()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.register(VendorCell.self, forCellReuseIdentifier: "VendorCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension CellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vendors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VendorCell", for: indexPath) as? VendorCell
        else { fatalError() }
        
        cell.configurateCell(vendor: vendors[indexPath.row])
        return cell
    }
}
    
extension CellViewController: UITableViewDelegate {
    
}
    
extension CellViewController {
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
}
