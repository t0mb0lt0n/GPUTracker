//
//  MainCell.swift
//  GPUTracker
//
//  Created by Alexander on 03.05.2024.
//

import UIKit

final class MainCell: UITableViewCell {
    let descriptionNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        label.text = "Introduced"
        return label
    }()
    
    var onlineStatusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .onlineStatusImage
        return imageView
    }()
        
    let descriptionValueTextView: UITextView = {
        let label = UITextView()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .systemGray
        label.text = "October 1990"
        label.isScrollEnabled = false
        label.isEditable = false
        return label
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
        [
         descriptionNameLabel,
         descriptionValueTextView,
         onlineStatusImageView
        ].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(subView)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            descriptionNameLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 10
            ),
            descriptionNameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 20
            ),
            descriptionNameLabel.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -10
            ),
            
            descriptionValueTextView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 10
            ),
            descriptionValueTextView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: 15
            ),
            descriptionValueTextView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 150
            ),
            descriptionValueTextView.heightAnchor.constraint(equalToConstant: 100),
            descriptionValueTextView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -15
            ),
            
            onlineStatusImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            onlineStatusImageView.widthAnchor.constraint(equalToConstant: 20),
            onlineStatusImageView.heightAnchor.constraint(equalToConstant: 20),
            onlineStatusImageView.leadingAnchor.constraint(equalTo: descriptionNameLabel.trailingAnchor, constant: 10)
        ])
    }
}
//MARK: - GPUInfoCellView extensions
extension MainCell {
    final func configurateCell(descriptionName: String?, descriptionValue: String?) {
        guard let descriptionName, let descriptionValue else { return }
        descriptionNameLabel.text = descriptionName
        descriptionValueTextView.text = descriptionValue
    }
}
