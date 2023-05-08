//
//  GPUInfoCellView.swift
//  GPUTracker
//
//  Created by Alexander on 08.05.2023.
//

import UIKit

class GPUInfoCellView: UITableViewCell {
    let cardImage = UIImageView()
    
    let cardNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    let rightArrowImage: UIImageView = {
        let image = UIImageView()
        let arrowImage = UIImage(systemName: "chevron.right")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        image.image = arrowImage
        return image
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        [cardImage, cardNameLabel, descriptionLabel, rightArrowImage].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(subView)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            cardImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            cardImage.heightAnchor.constraint(equalToConstant: 32),
            cardImage.widthAnchor.constraint(equalToConstant: 32),
            
            cardNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            cardNameLabel.leadingAnchor.constraint(equalTo: cardImage.trailingAnchor, constant: 10),
            cardNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            descriptionLabel.topAnchor.constraint(equalTo: cardNameLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: cardImage.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            rightArrowImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rightArrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            rightArrowImage.widthAnchor.constraint(equalToConstant: 12),
            rightArrowImage.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
}
    
extension GPUInfoCellView {
     func configurateCell(manufacturer: Manufacturer) {
        //      func configurateCell(manufacturer: Manufacturer) {
        cardImage.image = manufacturer.image
        cardNameLabel.text = manufacturer.name
        descriptionLabel.text = manufacturer.description
    }
}
