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
            let selectedGPU = getGPUFields(with: indexPath.row)
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
            fillLabels(labels: [targetVC.mainView!.idLabel], prefix: prefixes, data: [selectedGPU["id"]!])
            
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


arr[index].get(positionField)),
                 "id"          : try arr[index].get(idField),
                 "vendor"      : try arr[index].get(vendorField),
                 "gpuCores"    : try arr[index].get(gpuCoresField),
                 "gpName"      : try arr[index].get(gpNameField),
                 "tmus"        : try arr[index].get(tmusField),
                 "rops"        : try arr[index].get(ropsField),
                 "l1"          : try arr[index].get(l1Field),
                 "l2"          : try arr[index].get(l2Field),
                 "baseClock"   : try arr[index].get(baseClockField),
                 "boostClock"  : try arr[index].get(boostClockField),
                 "memClock"    : try arr[index].get(memClockField),
                 "memSize"     : try arr[index].get(memSizeField),
                 "memType"     : try arr[index].get(memTypeField),
                 "bus"         : try arr[index].get(busField),
                 "tdp"         : try arr[index].get(tdpField),
                 "psu"         : try arr[index].get(psuField),
                 "directx"     : try arr[index].get(directXField),
                 "openGL"      : try arr[index].get(openGLField),
                 "openCL"      : try arr[index].get(openCLField),
                 "vulcan"      : try arr[index].get(vulcanField),
                 "cuda"        : try arr[index].get(cudaVersionField),
                 "shaderModel" : try arr[index].get(shaderModelField)]
