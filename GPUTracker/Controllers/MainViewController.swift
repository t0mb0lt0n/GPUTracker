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
        let imageForHeaderLogo = UIImageView(frame: CGRect(x: 15, y: 5, width: 40, height: 40))
        let imageForHeaderCard = UIImageView(frame: CGRect(x: 5, y: 0, width: 100, height: 50))
        imageForHeaderLogo.contentMode = .scaleAspectFit
        imageForHeaderCard.contentMode = .scaleAspectFit
        let imageNvidia = UIImage(named: "gpu.icon.main")?.withTintColor(.systemGray2, renderingMode: .alwaysOriginal)
        let imageAMD = UIImage(named: "amd.logo.3")?.withTintColor(.systemGray2, renderingMode: .alwaysOriginal)
        let imageNvidiaCard = UIImage(named: "4090")
        let imageAMDCard = UIImage(named: "6900xt")
        let manufacturerNameLabel = UILabel(frame: CGRect(x: imageForHeaderLogo.frame.width + 25, y: imageForHeaderLogo.center.y - 10, width: 150, height: 15))
        manufacturerNameLabel.text = "Manufacturer name"
        manufacturerNameLabel.textColor = .systemGray
        customHeaderView.addSubview(manufacturerNameLabel)
        switch section {
        case 0:
            imageForHeaderLogo.image = imageNvidia
            imageForHeaderCard.image = imageNvidiaCard
            customHeaderView.addSubview(imageForHeaderLogo)
            //customHeaderView.addSubview(imageForHeaderCard)
            manufacturerNameLabel.text = "Nvidia"
            return customHeaderView
        case 1:
            imageForHeaderLogo.image = imageAMD
            imageForHeaderCard.image = imageAMDCard
            customHeaderView.addSubview(imageForHeaderLogo)
            //customHeaderView.addSubview(imageForHeaderCard)
            manufacturerNameLabel.text = "AMD"
            return customHeaderView
        default:
            return nil
        }
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
