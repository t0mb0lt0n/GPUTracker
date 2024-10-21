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
        label.text = "Debug text"
        label.backgroundColor = .red
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
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.textColor = .systemGray
        textView.font = .systemFont(
            ofSize: 17,
            weight: .regular
        )
        textView.text = "debug text"
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isUserInteractionEnabled = false
        textView.backgroundColor = .cyan
        //textView.contentInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        return textView
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
                constant: 20
            ),
            descriptionNameLabel.trailingAnchor.constraint(
                equalTo: onlineStatusImageView.leadingAnchor,
                constant: -2
            ),
            
            descriptionValueTextView.topAnchor.constraint(
                equalTo: descriptionNameLabel.bottomAnchor,
                constant: 0
            ),
            descriptionValueTextView.trailingAnchor.constraint(
                equalTo: descriptionNameLabel.trailingAnchor
            ),
            descriptionValueTextView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 20
            ),
            descriptionValueTextView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: 0
            ),
            
            onlineStatusImageView.centerYAnchor.constraint(
                equalTo: descriptionNameLabel.centerYAnchor
                //constant: descriptionNameLabel.centerYAnchor
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
        //contentView.layoutMargins.left + 100
    }
}

