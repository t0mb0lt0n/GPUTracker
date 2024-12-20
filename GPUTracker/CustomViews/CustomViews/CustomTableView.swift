//
//  CustomTableView.swift
//  GPUTracker
//
//  Created by Alexander on 08.04.2024.
//
import UIKit

final class CustomTableView: UITableView {
    init() {
        super .init(frame: .zero, style: .plain)
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
            BasicTableViewCell.self,
            forCellReuseIdentifier: BasicTableViewCell.defaultIdentifier
        )
    }
}
