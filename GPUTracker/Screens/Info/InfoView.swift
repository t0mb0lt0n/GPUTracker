//
//  InfoView.swift
//  GPUTracker
//
//  Created by Alexander on 18.12.2024.
//

import UIKit

final class InfoView: UIView {
    private lazy var infoTableView: UITableView = {
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
    
    private let appVersionLabel: UILabel = {
        let label = UILabel()
        label.text = .currentAppVersion
        label.textColor = .systemGray
        return label
    }()
    
    private let dismissButton: UIButton = {
        let button = UIButton(type: .close)
        button.setImage(.dismissButtonImage, for: .normal)
        return button
    }()
    
    var dismissButtonClosure: (() -> Void)?
    
    func setupInfoTableView(
        withDelegate delegate: UITableViewDelegate,
        andDataSource dataSource: UITableViewDataSource
    ) {
        infoTableView.delegate = delegate
        infoTableView.dataSource = dataSource
    }
    
    @objc private func closeButtonTapped() {
        dismissButtonClosure?()
    }

    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        dismissButton.addTarget(
            self, action: #selector(closeButtonTapped),
            for: .touchUpInside
        )
        backgroundColor = .secondarySystemBackground
        [
        infoTableView,
        appVersionLabel,
        dismissButton
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
            infoTableView.bottomAnchor.constraint(equalTo: appVersionLabel.topAnchor),
            
            appVersionLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            appVersionLabel.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: Constants.appVersionLabelBottomInset
            ),
            dismissButton.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: Constants.dismissButtonTopInset
            ),
            dismissButton.trailingAnchor.constraint(
                equalTo: infoTableView.trailingAnchor,
                constant: Constants.dismissButtonRightInset
            ),
        ])
    }
}

//MARK: - Constants
extension InfoView {
    private enum Constants {
        static let infoTableViewTopInset: CGFloat = 22.0
        static let dismissButtonTopInset: CGFloat = 10.0
        static let dismissButtonRightInset: CGFloat = -20.0
        static let appVersionLabelBottomInset: CGFloat = -10.0
    }
}
