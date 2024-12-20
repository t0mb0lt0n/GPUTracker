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
            OnlineStatusTableViewCell.self,
            forCellReuseIdentifier: OnlineStatusTableViewCell.defaultIdentifier
        )
        tableView.register(
            SectionDescriptionTableViewCell.self,
            forCellReuseIdentifier: SectionDescriptionTableViewCell.defaultIdentifier
        )
        return tableView
    }()
    
    let appVersionLabel: UILabel = {
        let label = UILabel()
        label.text = "Version 0.9.8.1"
        label.textColor = .systemGray
        return label
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
        backgroundColor = .secondarySystemBackground
        [
        infoTableView,
        appVersionLabel
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            infoTableView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: Constants.infoTableViewTopInset
            ),
            infoTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            infoTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            infoTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            appVersionLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            appVersionLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Constants.appVersionLabelBottomInset
            ),
        ])
    }
}

//MARK: - Constants
extension InfoView {
    private enum Constants {
        static let infoTableViewTopInset: CGFloat = 22.0
        static let appVersionLabelBottomInset: CGFloat = -7.0
    }
}
