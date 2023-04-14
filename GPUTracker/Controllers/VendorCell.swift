//
//  VendorCell.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit

class VendorCell: UITableViewCell {
    let vendorLogo = UIImageView()
    
    let vendorNameLabel: UILabel = {
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
        [vendorLogo, vendorNameLabel, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            vendorLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            vendorLogo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            vendorLogo.heightAnchor.constraint(equalToConstant: 32),
            vendorLogo.widthAnchor.constraint(equalToConstant: 32),
            
            vendorNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            vendorNameLabel.leadingAnchor.constraint(equalTo: vendorLogo.trailingAnchor, constant: 8),
            vendorNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            descriptionLabel.topAnchor.constraint(equalTo: vendorNameLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: vendorLogo.trailingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configurateCell(vendor: Vendor) {
        vendorLogo.image = vendor.image
        vendorNameLabel.text = vendor.name
        descriptionLabel.text = vendor.description
    }
    
}
