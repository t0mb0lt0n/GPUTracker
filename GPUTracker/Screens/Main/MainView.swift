//
//  MainView.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit

final class MainView: UIView {
    lazy var mainTableView: UITableView = {
        let tableView = UITableView(
            frame: .zero,
            style: .insetGrouped
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.isScrollEnabled = true
        tableView.register(
            MainCell.self,
            forCellReuseIdentifier: MainCell.defaultIdentifier
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
}

//MARK: - MainView extensions
extension MainView {
    final private func setupView() {
        [mainTableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    final private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
