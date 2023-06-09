//
//  GPUListViewController.swift
//  GPUTracker
//
//  Created by Alexander on 08.05.2023.
//

import UIKit
import SQLite

class GPUListViewController: UIViewController {
    
    enum Vendors: String {
        case nvidia = "Nvidia"
        case amd = "AMD"
    }
    var selectedVendor: String
    let gpuListTableView = UITableView(frame: .zero, style: .insetGrouped)
    
    init(selectedVendor: String) {
        self.selectedVendor = selectedVendor
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        switch selectedVendor {
        case "Nvidia":
            title = selectedVendor
        case "AMD":
            title = selectedVendor
        default:
            title = "Empty"
        }
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
        let gpuFieldsData = getSelectedGPUFields(fromTable: "Nvidia", with: indexPath.row)
        customCell.cardNameLabel.text = gpuFieldsData["id"] ?? "field is empty"
        customCell.descriptionLabel.text = gpuFieldsData["gpName"] ?? "field is empty"
        customCell.cardImage.image = UIImage(named: gpuFieldsData["id"] ?? "gpu1")
        return customCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectedVendor {
        case "Nvidia":
            return getDBRecordsCount(fromTable: selectedVendor)
        case "AMD":
            return getDBRecordsCount(fromTable: selectedVendor)
        default:
            return 0
        }
    }
}

extension GPUListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let targetVC = DescriptionViewController()
        let prefixes = ["ID",
                        "VENDOR",
                        "CORES",
                        "PROCESSOR",
                        "TMUs",
                        "ROPs",
                        "L1",
                        "L2",
                        "BASE CLK",
                        "BOOST CLK",
                        "MEMORY CLK",
                        "MEMORY SIZE",
                        "MEMORY TYPE",
                        "BUS WIDTH",
                        "TDP",
                        "PSU",
                        "DirectX",
                        "openGL",
                        "openCL",
                        "VULCAN",
                        "CUDA",
                        "SHADERS"]
        
        let specLabels = [targetVC.mainView!.idLabel,
                          targetVC.mainView!.vendorLabel,
                          targetVC.mainView!.gpuCoresLabel,
                          targetVC.mainView!.gpuNameLabel,
                          targetVC.mainView!.tmusLabel,
                          targetVC.mainView!.ropsLabel,
                          targetVC.mainView!.lOneLabel,
                          targetVC.mainView!.lTwoLabel,
                          targetVC.mainView!.baseClockLabel,
                          targetVC.mainView!.boostClockLabel,
                          targetVC.mainView!.memClockLabel,
                          targetVC.mainView!.memSizeLabel,
                          targetVC.mainView!.memTypeLabel,
                          targetVC.mainView!.busLabel,
                          targetVC.mainView!.tdpLabel,
                          targetVC.mainView!.psuLabel,
                          targetVC.mainView!.directXLabel,
                          targetVC.mainView!.openGLLabel,
                          targetVC.mainView!.openCLLabel,
                          targetVC.mainView!.vulcanLabel,
                          targetVC.mainView!.cudaLabel,
                          targetVC.mainView!.shaderLabel]
        
        switch indexPath.section {
        case 0:
            let selectedGPU = getSelectedGPUFields(fromTable: selectedVendor, with: indexPath.row)
            let data = getSelectedGPUData(from: selectedGPU)
            //fill subVievs with specData
            fillLabels(labels: specLabels, prefix: prefixes, data: data)
            changeLabelAttributes(inLabels: specLabels, inStrings: data)
            present(targetVC, animated: true)
        case 1:
            let selectedGPU = getSelectedGPUFields(fromTable: selectedVendor, with: indexPath.row)
            let data = getSelectedGPUData(from: selectedGPU)
            //fill subVievs with specData
            fillLabels(labels: specLabels, prefix: prefixes, data: data)
            changeLabelAttributes(inLabels: specLabels, inStrings: data)
            present(targetVC, animated: true)
        default:
            break
        }
        //deselect tableView row
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension GPUListViewController {
    func fillLabels(labels: [UILabel], prefix: [String], data: [String?]) {
        for (index, value) in labels.enumerated() {
            value.text = "\(prefix[index]) \(data[index] ?? "data field is empty")"
        }
    }
    //Setting new attributes to the text
    func changeLabelAttributes(inLabels labels: [UILabel], inStrings strings: [String?]) {
        for (index, value) in labels.enumerated() {
            guard let fullText = labels[index].text, let changeText = strings[index] else {
                break
            }
            value.labelTextAttributesChange(fullText: fullText, changeText: changeText)
        }
    }
    //Get all data fields from selected ROW
    func getSelectedGPUData(from selectedGPUDict: [String : String]) -> [String?] {
        let resultData = [selectedGPUDict["id"],
                          selectedGPUDict["vendor"],
                          selectedGPUDict["gpuCores"],
                          selectedGPUDict["gpName"],
                          selectedGPUDict["tmus"],
                          selectedGPUDict["rops"],
                          selectedGPUDict["l1"],
                          selectedGPUDict["l2"],
                          selectedGPUDict["baseClock"],
                          selectedGPUDict["boostClock"],
                          selectedGPUDict["memClock"],
                          selectedGPUDict["memSize"],
                          selectedGPUDict["memType"],
                          selectedGPUDict["bus"],
                          selectedGPUDict["tdp"],
                          selectedGPUDict["psu"],
                          selectedGPUDict["directx"],
                          selectedGPUDict["openGL"],
                          selectedGPUDict["openCL"],
                          selectedGPUDict["vulcan"],
                          selectedGPUDict["cuda"],
                          selectedGPUDict["shaderModel"]]
        return resultData
    }
}



