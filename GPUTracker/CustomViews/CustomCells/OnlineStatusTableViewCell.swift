//
//  InfoTableViewCell.swift
//  GPUTracker
//
//  Created by Alexander on 18.12.2024.
//

import UIKit

final class OnlineStatusTableViewCell: UITableViewCell {
    private let onlineStatusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .online
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let descriptionValueTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .systemGray
        textView.font = .systemFont(
            ofSize: Constants.textViewFontSize,
            weight: .regular
        )
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isUserInteractionEnabled = false
        textView.textContainer.lineFragmentPadding = Constants.lineFragmentPadding
        textView.textContainerInset = .zero
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
        setupCell(
            selectionStyle: .none,
            accessoryType: .checkmark
        )
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        descriptionValueTextView.text = nil
        onlineStatusImageView.image = nil
    }
    
    private func setupCell(
        selectionStyle: UITableViewCell.SelectionStyle,
        accessoryType: UITableViewCell.AccessoryType
    ) {
        self.selectionStyle = selectionStyle
        self.accessoryType = accessoryType
        [
         descriptionValueTextView,
         onlineStatusImageView
        ].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(subView)
        }
    }
        
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            descriptionValueTextView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.descriptionValueTextViewTopInset
            ),
            descriptionValueTextView.leadingAnchor.constraint(
                equalTo: onlineStatusImageView.trailingAnchor,
                constant: Constants.descriptionValueTextViewLeftInset
            ),
            descriptionValueTextView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.descriptionValueTextViewLeftInset
            ),
            descriptionValueTextView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Constants.descriptionValueTextViewBottomInset
            ),
            onlineStatusImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            onlineStatusImageView.widthAnchor.constraint(equalToConstant: Constants.onlineStatusImageViewWidth),
            onlineStatusImageView.heightAnchor.constraint(equalToConstant: Constants.onlineStatusImageViewHeight),
            onlineStatusImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.onlineStatusImageViewLeftInset
            ),
        ])
    }
}
//MARK: - MainCell extensions
extension OnlineStatusTableViewCell {
    final func configurateCell(
        descriptionValue: String,
        onlineStatus: String
    ) {
        switch onlineStatus {
        case .online:
            onlineStatusImageView.image = .online
        case .partially:
            onlineStatusImageView.image = .partially
        default:
            onlineStatusImageView.image = .offline
        }
        descriptionValueTextView.text = descriptionValue
    }
}

//MARK: - Constants
extension OnlineStatusTableViewCell {
    private enum Constants {
        static let defaultTopSystemInset: CGFloat = 8.0
        static let onlineStatusImageViewWidth: CGFloat = 10.0
        static let onlineStatusImageViewHeight: CGFloat = 10.0
        static let onlineStatusImageViewRightOffset: CGFloat = 11.0
        static let descriptionValueTextViewLeftInset: CGFloat = 10
        static let onlineStatusImageViewLeftInset: CGFloat = 10
        static let descriptionValueTextViewTopInset: CGFloat = 2.0
        static let descriptionValueTextViewBottomInset: CGFloat = -5.0
        static let lineFragmentPadding: CGFloat = 0.0
        static let descriptionNameLabelFontSize: CGFloat = 17.0
        static let textViewFontSize: CGFloat = 16.0
    }
}
