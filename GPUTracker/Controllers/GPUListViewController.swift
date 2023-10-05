//
//  GPUListViewController.swift
//  GPUTracker
//
//  Created by Alexander on 08.05.2023.
//

import UIKit

final class GPUListViewController: UIViewController {
    enum Vendors: String {
        case nvidia = "Nvidia"
        case amd = "AMD"
    }
    var selectedVendor: String
    let gpuListTableView = UITableView(frame: .zero, style: .insetGrouped)
    
    //MARK: init
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
        title = selectedVendor
        //MARK: Cell configuration
        gpuListTableView.register(GPUInfoCellView.self, forCellReuseIdentifier: "GPUInfoCellView")
        gpuListTableView.delegate = self
        gpuListTableView.dataSource = self
        gpuListTableView.isScrollEnabled = true
        gpuListTableView.separatorInset = UIEdgeInsets(top: 0, left: 75, bottom: 0, right: 0)
        setupTableView()
    }
}

// MARK: - GPUListViewController extensions

extension GPUListViewController {
    private func setupTableView() {
        view.addSubview(gpuListTableView)
        gpuListTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gpuListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            gpuListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            gpuListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gpuListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension GPUListViewController: UITableViewDataSource {
    final func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: "GPUInfoCellView", for: indexPath) as? GPUInfoCellView
        else { fatalError() }
        let gpuFieldsData = getSelectedGPUFields(fromTable: selectedVendor, with: indexPath.row)
        customCell.configurateCell(gpuFieldsData)
        return customCell
    }
    
    final func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    final func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let targetVC = DescriptionViewController()
        targetVC.sheetPresentationController?.prefersGrabberVisible = true
        let backgroundQueue = DispatchQueue(label: "com.gmail@goralexwizard", qos: .background)
        backgroundQueue.async {
            let selectedGPU = getSelectedGPUFields(fromTable: self.selectedVendor, with: indexPath.row)
            let datafromSelectedRow = getDataFromSelectedRow(from: selectedGPU)
            DispatchQueue.main.async {
                let imageNames = [(selectedGPU["id"] ?? "") + "Crystal",
                                  (selectedGPU["id"] ?? "")]
                let imageViews = [targetVC.mainView.crystalImageView,
                                  targetVC.mainView.cardImageView]
                targetVC.configurateLabels(data: datafromSelectedRow)
                targetVC.changeLabelAttributes(inStrings: datafromSelectedRow)
                targetVC.setupGPUImages(imageViews: imageViews, imageNames: imageNames)
            }
        }
        present(targetVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



