//
//  GeneralCell.swift
//  GPUTracker
//
//  Created by Alexander on 09.04.2024.
//


import UIKit

final class GeneralCell: UITableViewCell {
    let descriptionNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "Introduced"
        return label
    }()
    
    let descriptionValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.text = "October 1990"
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
        [
         descriptionNameLabel,
         descriptionValueLabel,
        ].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(subView)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
//            cardImage.topAnchor.constraint(
//                equalTo: contentView.topAnchor,
//                constant: 7
//            ),
//            cardImage.leadingAnchor.constraint(
//                equalTo: contentView.leadingAnchor,
//                constant: 15
//            ),
//            cardImage.heightAnchor.constraint(equalToConstant: 43),
//            cardImage.widthAnchor.constraint(equalToConstant: 43),
            
            descriptionNameLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 10
            ),
            descriptionNameLabel.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            ),
            descriptionNameLabel.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -10
            ),
            
            descriptionValueLabel.topAnchor.constraint(
                equalTo: descriptionNameLabel.bottomAnchor,
                constant: 2
            ),
            descriptionValueLabel.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            ),
            descriptionValueLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -8
            ),
            descriptionValueLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -10
            )
        ])
    }
}
//MARK: - GPUInfoCellView extensions
extension GeneralCell {
    final func configurateCell(descriptionName: String?, descriptionValue: String?) {
        guard let descriptionName, let descriptionValue else { return }
        descriptionNameLabel.text = descriptionName
        descriptionValueLabel.text = descriptionValue
    }
}
