//
//  GPUInfoCellView.swift
//  GPUTracker
//
//  Created by Alexander on 08.05.2023.
//

import UIKit

final class GPUInfoCellView: UITableViewCell {
    let cardImage = UIImageView()
    
    let cardNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "Text"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.text = "text"
        return label
    }()
    
    //MARK: init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupConstraints()
        cardImage.image = UIImage(named: "ps3")
        cardImage.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        accessoryType = .detailButton
        [cardImage,
         cardNameLabel,
         descriptionLabel,
        ].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(subView)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 7
            ),
            cardImage.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 15
            ),
            cardImage.heightAnchor.constraint(equalToConstant: 43),
            cardImage.widthAnchor.constraint(equalToConstant: 43),
            
            cardNameLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 10
            ),
            cardNameLabel.leadingAnchor.constraint(
                equalTo: cardImage.trailingAnchor,
                constant: 20
            ),
            cardNameLabel.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -10
            ),
            
            descriptionLabel.topAnchor.constraint(
                equalTo: cardNameLabel.bottomAnchor,
                constant: 2
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: cardImage.trailingAnchor,
                constant: 20
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -8
            ),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -10
            )
        ])
    }
}
//MARK: - GPUInfoCellView extensions
extension GPUInfoCellView {
    final func configurateCell(_ gpuDescription: [String: String]) {
        guard let image = gpuDescription["id"],
              let id = gpuDescription["id"],
              let description = gpuDescription["gpName"] else {return}
        cardImage.image = UIImage(named: image + "Crystal")
        cardNameLabel.text = id
        descriptionLabel.text = description
    }
}
