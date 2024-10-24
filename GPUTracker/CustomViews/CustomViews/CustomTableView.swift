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
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView() {
        backgroundColor = .secondarySystemBackground
        estimatedRowHeight = UITableView.automaticDimension
        rowHeight = UITableView.automaticDimension
        register(
            UniversalCustomCell.self,
            forCellReuseIdentifier: "\(UniversalCustomCell.self)"
        )
    }
}
