//
//  GPUListViewController.swift
//  GPUTracker
//
//  Created by Alexander on 08.05.2023.
//

import UIKit
import SQLite

class GPUListViewController: UIViewController {
    let gpuListTableView = UITableView(frame: .zero, style: .insetGrouped)
    let manufacturers = Source.generateManufacturersWithGroups()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "Nvidia"
        //Cell registration
        gpuListTableView.register(GPUInfoCellView.self, forCellReuseIdentifier: "GPUInfoCellView")
        gpuListTableView.delegate = self
        gpuListTableView.dataSource = self
        gpuListTableView.isScrollEnabled = true
        setupTableView()
    }
}

// MARK: -Extensions for TableView CFG

extension GPUListViewController {
    private func setupTableView() {
        view.addSubview(gpuListTableView)
        gpuListTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gpuListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            gpuListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            gpuListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gpuListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension GPUListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: "GPUInfoCellView", for: indexPath) as? GPUInfoCellView
        else { fatalError() }
        let gpuFieldsData = getGPUFields(with: indexPath.row)
        customCell.cardNameLabel.text = gpuFieldsData["id"]
        customCell.descriptionLabel.text = gpuFieldsData["gpuCores"]
        customCell.cardImage.image = UIImage(named: gpuFieldsData["id"]!)
        
        return customCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        getDBRecordsCount()
    }
}

extension GPUListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let targetVC = DescriptionViewController()
// MARK: - DB test zone
            let selectedGPU = String(getGPUFields(with: indexPath.row))
            //targetVC.mainView?.idLabel.text = "ID:  \(selectedGPU["id"] ?? "not found")"
            let prefixes = ["ID",
                            "VENDOR",
                            "GPU CORES",
                            "PROCESSOR",
                            "TMUs",
                            "ROPs",
                            "L1",
                            "L2",
                            "Base CLK",
                            "BOOST CLK",
                            "MEMORY SIZE",
                            "MEMORY TYPE",
                            "BUS",
                            "TDP",
                            "PSU",
                            "DirectX",
                            "openGL",
                            "openCL",
                            "VULCAN",
                            "CUDA",
                            "SHADER MODEL"]
            
            let data = [selectedGPU["id"],
                        selectedGPU["vendor"],
                        selectedGPU["gpuCores"],
                        selectedGPU["gpName"],
                        selectedGPU["tmus"],
                        selectedGPU["rops"],
                        selectedGPU["l1"],
                        selectedGPU["l2"],
                        selectedGPU["baseClock"],
                        selectedGPU["boostClock"],
                        selectedGPU["memClock"],
                        selectedGPU["memSize"],
                        selectedGPU["memType"],
                        selectedGPU["bus"],
                        selectedGPU["tdp"],
                        selectedGPU["psu"],
                        selectedGPU["directx"],
                        selectedGPU["openGL"],
                        selectedGPU["openCL"],
                        selectedGPU["vulcan"],
                        selectedGPU["cuda"],
                        selectedGPU["shaderModel"]]
            
            fillLabels(labels: [targetVC.mainView!.idLabel], prefix: prefixes, data: data])
            
            changeLabelAttributes(inLabels: [targetVC.mainView!.idLabel,
                                       targetVC.mainView!.gpuNameLabel], inStrings: [selectedGPU["id"] ?? "",
                                                                                    selectedGPU["gpName"] ?? ""])
            
            
            present(targetVC, animated: true)
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

extension GPUListViewController {
    func fillLabels(labels: [UILabel], prefix: [String], data: [String]) {
        var i = 0
        for label in labels {
            label.text = "\(prefix[i]): \(data[i] ?? "not found")"
            i += 1
        }
    }
    
    
    func changeLabelAttributes(inLabels labels: [UILabel], inStrings strings: [String]) {
        var i = 0
        for label in labels  {
            label.labelTextAttributesChange(fullText: labels[i].text ?? "", changeText: strings[i])
            i += 1
        }
    }
}



