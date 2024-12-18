//
//  InfoView.swift
//  GPUTracker
//
//  Created by Alexander on 18.12.2024.
//

import UIKit

class InfoView: UIView {
    lazy var infoTableView: UITableView = {
        let tableView = UITableView(
            frame: .zero,
            style: .insetGrouped
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.isScrollEnabled = false
        tableView.register(
            InfoTableViewCell.self,
            forCellReuseIdentifier: InfoTableViewCell.defaultIdentifier
        )
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
    }
    
    private func setupConstraints() {
        
    }
    
    
    
    

}
