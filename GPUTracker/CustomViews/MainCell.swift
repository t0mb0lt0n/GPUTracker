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
        label.font = .systemFont(
            ofSize: 17,
            weight: .semibold
        )
        label.textColor = .black
        label.text = "debug text"
        return label
    }()
    
    var onlineStatusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .onlineStatusImage
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
            
    let descriptionValueTextView: UITextView = {
        let label = UITextView()
        label.font = .systemFont(
            ofSize: 17,
            weight: .regular
        )
        label.textColor = .systemGray
        label.text = "debug text"
        label.isScrollEnabled = false
        label.isEditable = false
        label.isUserInteractionEnabled = false
        return label
    }()
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
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
                equalTo: contentView.safeAreaLayoutGuide.topAnchor,
                constant: contentView.layoutMargins.top
            ),
            descriptionNameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: contentView.layoutMargins.left
            ),
            descriptionNameLabel.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -10
            ),
            
            descriptionValueTextView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 0
            ),
            descriptionValueTextView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -15
            ),
            descriptionValueTextView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: contentView.layoutMargins.left
            ),
            descriptionValueTextView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: 0
            ),
            
            onlineStatusImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: contentView.layoutMargins.top
            ),
            onlineStatusImageView.widthAnchor.constraint(equalToConstant: 12),
            onlineStatusImageView.heightAnchor.constraint(equalToConstant: 12),
            onlineStatusImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -contentView.layoutMargins.right
            ),
        ])
    }
}
//MARK: - GPUInfoCellView extensions
extension MainCell {
    final func configurateCell(
        descriptionName: String?,
        descriptionValue: String?
    ) {
        guard
            let descriptionName,
            let descriptionValue
        else { return }
        descriptionNameLabel.text = descriptionName
        descriptionValueTextView.text = descriptionValue
    }
}

//MARK: - Constants
extension MainCell {
    private enum Constants {
        static let defaultTopSystemInset: CGFloat = 8.0
    }
}

