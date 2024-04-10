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
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        label.text = "Board name/Revision/GPU variant/CPU variant/HDMI Support"
        return label
    }()
    
    let boardNameValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .systemGray
        label.text = "Xenon/Original XBOX 360/90nm Y1/90nm XCPU/No Hdmi"
        return label
    }()
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.
        return stackView
    }()
    
    
    let revisionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "Revision"
        return label
    }()
    
    let revisionValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "Original XBOX 360"
        return label
    }()

    let gpuLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.text = "GPU variant"
        return label
    }()
    
    let gpuValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.text = "90nm Y1"
        return label
    }()
    
    let cpuLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.text = "CPU variant"
        return label
    }()
    
    let cpuValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.text = "90nm XCPU"
        return label
    }()
    
    //MARK: init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        accessoryType = .detailButton
        [
            descriptionHeaderLabel,
            boardNameValueLabel,
           // revisionLabel,
            //revisionValueLabel,
            //gpuLabel,
            //gpuValueLabel,
            //cpuLabel,
            //cpuValueLabel
        ].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(subView)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            boardNameLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 2
            ),
            boardNameLabel.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 2
            ),
            boardNameLabel.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -10
            ),
            
            boardNameValueLabel.topAnchor.constraint(
                equalTo: boardNameLabel.bottomAnchor,
                constant: 2
            ),
            boardNameValueLabel.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 2
            ),
            boardNameValueLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -8
            )
        ])
    }
}
//MARK: - MotherboardCell extensions
extension MotherboardCell {
    final func configurateCell(descriptionName: String?, descriptionValue: String?) {
        guard let descriptionName, let descriptionValue else { return }
//        descriptionNameLabel.text = descriptionName
//        descriptionValueLabel.text = descriptionValue
    }
}
