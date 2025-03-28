//
//  MainView.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit

final class MainCatalogueView: UIView {
    lazy var mainCatalogueTableView: UITableView = {
        let tableView = UITableView(
            frame: .zero,
            style: .insetGrouped
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.isScrollEnabled = true
        tableView.register(
            MainCatalogueTableViewCell.self,
            forCellReuseIdentifier: MainCatalogueTableViewCell.defaultIdentifier
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
    
    final private func setupView() {
        [mainCatalogueTableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    final private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainCatalogueTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainCatalogueTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainCatalogueTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mainCatalogueTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
