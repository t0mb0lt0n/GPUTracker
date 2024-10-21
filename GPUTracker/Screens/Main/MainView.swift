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
            forCellReuseIdentifier: "\(MainCell.self)"
        )
        return tableView
    }()
    
    let debugLabel: UILabel = {
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
        //debugLabel,
        mainTableView
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    final private func setupConstraints() {
        NSLayoutConstraint.activate([
//            debugLabel.leadingAnchor.constraint(
//                equalTo: safeAreaLayoutGuide.leadingAnchor,
//                constant: Constants.debugLabelOffset
//            ),
//            debugLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            debugLabel.widthAnchor.constraint(equalToConstant: 50),
//            debugLabel.heightAnchor.constraint(equalToConstant: 20),
            
            mainTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
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
        static let debugLabelOffset: CGFloat = 100
    }
}
