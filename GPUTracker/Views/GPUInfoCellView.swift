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
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    let memorySizeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()

    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    let rightInfoImage: UIImageView = {
        let image = UIImageView()
        let arrowImage = UIImage(systemName: "info.circle")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        image.image = arrowImage
        return image
    }()
    
//MARK: -init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        [cardImage,
         cardNameLabel,
         descriptionLabel,
         rightInfoImage,
         memorySizeLabel].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(subView)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            cardImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            cardImage.heightAnchor.constraint(equalToConstant: 43),
            cardImage.widthAnchor.constraint(equalToConstant: 43),
            
            cardNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cardNameLabel.leadingAnchor.constraint(equalTo: cardImage.trailingAnchor, constant: 20),
            
            memorySizeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            memorySizeLabel.leadingAnchor.constraint(equalTo: cardNameLabel.trailingAnchor, constant: 5),
            
            descriptionLabel.topAnchor.constraint(equalTo: cardNameLabel.bottomAnchor, constant: 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: cardImage.trailingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            rightInfoImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rightInfoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            rightInfoImage.widthAnchor.constraint(equalToConstant: 25),
            rightInfoImage.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
    
extension GPUInfoCellView {
     func configurateCell(manufacturer: Manufacturer) {
        cardImage.image = manufacturer.image
        cardNameLabel.text = manufacturer.name
        descriptionLabel.text = manufacturer.description
    }
}
