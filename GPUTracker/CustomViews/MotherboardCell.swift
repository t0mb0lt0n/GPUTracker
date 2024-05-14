//
//  MotherboardCell.swift
//  GPUTracker
//
//  Created by Alexander on 10.04.2024.
//

import UIKit

final class MotherboardCell: UITableViewCell {
    let descriptionHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(
            ofSize: 17,
            weight: .semibold
        )
        label.textColor = .black
        label.text = "Board name"
        return label
    }()
    
    let boardNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(
            ofSize: 17,
            weight: .regular
        )
        label.textColor = .systemGray
        label.text = "Xenon"
        return label
    }()
    
    let revisionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(
            ofSize: 15,
            weight: .medium
        )
        label.textColor = .systemGray
        label.text = "Original XBOX 360"
        return label
    }()
    
    let gpuLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(
            ofSize: 17,
            weight: .medium
        )
        label.textColor = .systemGray
        label.text = "90nm Y1"
        return label
    }()
    
    let cpuLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(
            ofSize: 17,
            weight: .medium
        )
        label.textColor = .systemGray
        label.text = "90nm XCPU"
        return label
    }()
    
    let hdmiSupportLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(
            ofSize: 17,
            weight: .medium
        )
        label.textColor = .systemGray
        label.text = "No Hdmi"
        return label
    }()
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private func addItemsToStackView() {
        let itemsForCellStackView: [UIView] = [
            boardNameLabel,
            revisionLabel,
            gpuLabel,
            cpuLabel,
            hdmiSupportLabel
        ]
        itemsForCellStackView.forEach { horizontalStackView.addArrangedSubview($0) }
    }
    
    private func configurateHorizontalStackView(_ stackView: UIStackView) {
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing = 1
    }
    
    //MARK: init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupConstraints()
        addItemsToStackView()
        configurateHorizontalStackView(horizontalStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        [
        descriptionHeaderLabel,
        horizontalStackView
        ].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(subView)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            descriptionHeaderLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 2
            ),
            descriptionHeaderLabel.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 10
            ),
            descriptionHeaderLabel.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -10
            ),
            
            horizontalStackView.topAnchor.constraint(
                equalTo: descriptionHeaderLabel.bottomAnchor,
                constant: 5
            ),
            horizontalStackView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 10
            ),
            horizontalStackView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -10
            )
        ])
    }
}
//MARK: - MotherboardCell extensions
extension MotherboardCell {
    final func configurateCell(
        descriptionHeader: String?,
        boardName: String?,
        revision: String?,
        gpu: String?,
        cpu: String?,
        isHdmi: String?
    ) {
        guard
            let boardName,
            let revision,
            let gpu,
            let cpu,
            let isHdmi
        else { return }
        descriptionHeaderLabel.text = descriptionHeader
        boardNameLabel.text = boardName
        revisionLabel.text =  "/" + revision
        gpuLabel.text = "/" + gpu
        cpuLabel.text = "/" + cpu
        hdmiSupportLabel.text = "/" + isHdmi
    }
}
