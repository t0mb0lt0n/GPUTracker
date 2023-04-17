//
//  ViewController.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    lazy var mainView = view as? MainView
    let vendors = Source.generateVendorsWithGroups()
    let tableView = UITableView(frame: .zero, style: .grouped)
    //let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemFill
        view = MainView()
        title = "Vendors"
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
        tableView.register(VendorCellView.self, forCellReuseIdentifier: "VendorCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        //tableView.sectionHeaderHeight = 50
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Nvidia"
        case 1:
            return "AMD"
        default:
            return "not found"
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vendors[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VendorCell", for: indexPath) as? VendorCellView
        else { fatalError() }
        
        cell.configurateCell(vendor: vendors[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        let imageForHeader = UIImageView(frame: CGRect(x: 5, y: 5, width: customHeaderView.frame.width - 10, height: customHeaderView.frame.height - 10))
        imageForHeader.contentMode = .scaleAspectFit
        let imageNvidia = UIImage(systemName: "circle")
        let imageAMD = UIImage(systemName: "iphone")
        
        switch section {
        case 0:
            imageForHeader.image = imageAMD
            customHeaderView.addSubview(imageForHeader)
            return customHeaderView
        case 1:
            imageForHeader.image = imageNvidia
            customHeaderView.addSubview(imageForHeader)
            return customHeaderView
        default:
            break
        }
        return customHeaderView
    }
}
    
extension MainViewController: UITableViewDelegate {
    
}
    
extension MainViewController {
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: mainView!.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
}
