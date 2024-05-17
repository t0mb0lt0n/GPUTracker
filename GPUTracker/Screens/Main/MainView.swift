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
            style: .grouped
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.isScrollEnabled = false
        tableView.register(
            MainCell.self,
            forCellReuseIdentifier: "\(MainCell.self)"
        )
        tableView.backgroundColor = .secondarySystemBackground
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    let itemNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Debug Label"
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - MainView extensions
extension MainView {
    final private func setupView() {
        [
        itemNameLabel,
        mainTableView
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    final private func setupConstraints() {
        NSLayoutConstraint.activate([
            itemNameLabel.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 0
            ),
            itemNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            itemNameLabel.widthAnchor.constraint(equalToConstant: 170),
            itemNameLabel.heightAnchor.constraint(equalToConstant: 100),
            
            mainTableView.topAnchor.constraint(
                equalTo: itemNameLabel.bottomAnchor,
                constant: 50
            ),
            mainTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension MainView {
    private enum Constants {
        static let appNameLabelTopOffsetConstant: CGFloat = -25
        static let appLogoHeight: CGFloat = 115
        static let appLogoWidth: CGFloat = 135
        static let appNameLabelHeight:  CGFloat = 20
        static let appNameLabelWidth: CGFloat = 200
        static let appNameLabelLeadingOffsetConstant: CGFloat = -35
        static let appNameBottomPadding: CGFloat = -10
        static let defaultTopSystemInset: CGFloat = 8.0
    }
}
