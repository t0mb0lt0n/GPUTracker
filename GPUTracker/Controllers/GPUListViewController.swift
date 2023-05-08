//
//  GPUListViewController.swift
//  GPUTracker
//
//  Created by Alexander on 08.05.2023.
//

import UIKit

class GPUListViewController: UIViewController {
    let gpuListTableView = UITableView(frame: .zero, style: .plain)
    let manufacturers = Source.generateManufacturersWithGroups()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        //Cell registration
        gpuListTableView.register(GPUInfoCellView.self, forCellReuseIdentifier: "GPUInfoCellView")
        gpuListTableView.delegate.self
        gpuListTableView.dataSource.self
        gpuListTableView.isScrollEnabled = true
        setupTableView()
    }
    

    


}

// MARK: -Extensions

extension GPUListViewController {
    private func setupTableView() {
        view.addSubview(gpuListTableView)
        gpuListTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gpuListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            gpuListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            gpuListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gpuListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}

extension GPUListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: "GPUInfoCellView", for: indexPath) as? GPUInfoCellView
        else { fatalError() }
        customCell.configurateCell(manufacturer: manufacturers[indexPath.section][indexPath.row])
        return customCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
}

extension GPUListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let targetVC = GPUListViewController()
            // MARK: - DB test zone
            //let gpuInfoFields = getGPU(withName: "GTX-780TI")
            navigationController?.pushViewController(targetVC, animated: true)
        case 1:
            let targetVC = UIViewController()
            navigationController?.pushViewController(targetVC, animated: true)
        default:
            break
        }
        //deselect tableView row
        tableView.deselectRow(at: indexPath, animated: true)
    }
}