//
//  InfoTableViewCell.swift
//  GPUTracker
//
//  Created by Alexander on 18.12.2024.
//

import UIKit

final class InfoTableViewCell: UITableViewCell {
    private let descriptionNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(
            ofSize: Constants.descriptionNameLabelFontSize,
            weight: .medium
        )
        label.textColor = .systemGray
        return label
    }()
    
    private let onlineStatusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .online
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
            
    private let descriptionValueTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
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
        setupCell()
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
                constant: Constants.descriptionNameLabelLeadingInset
            ),
            descriptionNameLabel.trailingAnchor.constraint(
                equalTo: onlineStatusImageView.leadingAnchor,
                constant: Constants.descriptionNameLabelTrailingInset
            ),
            
            descriptionValueTextView.topAnchor.constraint(
                equalTo: descriptionNameLabel.bottomAnchor,
                constant: Constants.descriptionValueTextViewTopInset
            ),
            descriptionValueTextView.trailingAnchor.constraint(equalTo: descriptionNameLabel.trailingAnchor),
            descriptionValueTextView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.descriptionValueTextViewLeftInset
            ),
            descriptionValueTextView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Constants.descriptionValueTextViewBottomInset
            ),
            onlineStatusImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            onlineStatusImageView.widthAnchor.constraint(equalToConstant: Constants.onlineStatusImageViewWidth),
            onlineStatusImageView.heightAnchor.constraint(equalToConstant: Constants.onlineStatusImageViewHeight),
            onlineStatusImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: contentView.layoutMargins.right - Constants.onlineStatusImageViewRightOffset
            ),
        ])
    }
}
//MARK: - MainCell extensions
extension InfoTableViewCell {
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
extension InfoTableViewCell {
    private enum Constants {
        static let defaultTopSystemInset: CGFloat = 8.0
        static let descriptionNameLabelLeadingInset: CGFloat = 20.0
        static let descriptionNameLabelTrailingInset: CGFloat = -10.0
        static let onlineStatusImageViewWidth: CGFloat = 10.0
        static let onlineStatusImageViewHeight: CGFloat = 10.0
        static let onlineStatusImageViewRightOffset: CGFloat = 11.0
        static let descriptionValueTextViewLeftInset: CGFloat = 20.0
        static let descriptionValueTextViewTopInset: CGFloat = 2.0
        static let descriptionValueTextViewBottomInset: CGFloat = -5.0
        static let lineFragmentPadding: CGFloat = 0.0
        static let descriptionNameLabelFontSize: CGFloat = 17.0
        static let textViewFontSize: CGFloat = 16.0
    }
}
