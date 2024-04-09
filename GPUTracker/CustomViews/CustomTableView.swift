//
//  CustomTableView.swift
//  GPUTracker
//
//  Created by Alexander on 08.04.2024.
//

import UIKit

class CustomTableView: UITableView {
    init() {
        super .init(frame: .zero, style: .grouped)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionView() {
        register(
            GPUInfoCellView.self,
            forCellReuseIdentifier: "GPUInfoCellView"
        )
    }
}
