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
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    //let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemFill
        view = MainView()
        title = "Manufacturers"
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = false
        setupTableView()
        tableView.register(VendorCellView.self, forCellReuseIdentifier: "VendorCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        //tableView.sectionHeaderHeight = 50
    }
    
}

//MARK: - extension
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
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerPadding = UIView()
        return footerPadding
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
    
    //setting header in section height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    //setting footer in section height
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        10
    }

    
    //custom header view for table view
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customHeaderView = UIView()
        let manufacturerNameLabel = UILabel(frame: CGRect(x: 5, y: 20, width: 150, height: 15))
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
    
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let targetVC = MainViewController()
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
    
extension MainViewController {
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: mainView!.safeAreaLayoutGuide.topAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: mainView!.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: mainView!.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: mainView!.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
