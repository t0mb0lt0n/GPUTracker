//
//  GPUInfoCellView.swift
//  GPUTracker
//
//  Created by Alexander on 08.05.2023.
//

import UIKit

class GPUInfoCellView: UITableViewCell {
    let cardImage = UIImageView()
    
    let cardName: UILabel = {
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
        [cardImage, cardName, descriptionLabel, rightArrowImage].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(subView)
        }
    }
    
    private func setupConstraints() {
        
    }
    
}
