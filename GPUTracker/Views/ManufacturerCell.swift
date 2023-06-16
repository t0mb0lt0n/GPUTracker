//
//  ManufacturerCell.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit

class ManufacturerCell: UITableViewCell {
    let manufacturerLogo = UIImageView()
    
    let manufacturerNameLabel: UILabel = {
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
    
    let rightArrowImage: UIImageView = {
        let image = UIImageView()
        let arrowImage = UIImage(systemName: "chevron.right")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        image.image = arrowImage
        return image
    }()
    
    //MARK: - custom cell init with cell reuse identifier
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        //add subViews into the cell
        [manufacturerLogo, manufacturerNameLabel, descriptionLabel, rightArrowImage].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            manufacturerLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            manufacturerLogo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            manufacturerLogo.heightAnchor.constraint(equalToConstant: 32),
            manufacturerLogo.widthAnchor.constraint(equalToConstant: 32),
            
            manufacturerNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            manufacturerNameLabel.leadingAnchor.constraint(equalTo: manufacturerLogo.trailingAnchor, constant: 10),
            
            descriptionLabel.topAnchor.constraint(equalTo: manufacturerNameLabel.bottomAnchor, constant: 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: manufacturerLogo.trailingAnchor, constant: 10),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            rightArrowImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rightArrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            rightArrowImage.widthAnchor.constraint(equalToConstant: 12),
            rightArrowImage.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func configurateCell(manufacturer: Manufacturer) {
        manufacturerLogo.image = manufacturer.image
        manufacturerNameLabel.text = manufacturer.name
        descriptionLabel.text = manufacturer.description
    }
}
