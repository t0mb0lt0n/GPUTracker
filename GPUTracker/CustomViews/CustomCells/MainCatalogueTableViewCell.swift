//
//  MainCell.swift
//  GPUTracker
//
//  Created by Alexander on 03.05.2024.
//

import UIKit

final class MainCatalogueTableViewCell: UITableViewCell {
    private let descriptionNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(
            ofSize: Constants.descriptionNameLabelFontSize,
            weight: .medium
        )
        label.textColor = .black
        return label
    }()
    
    private let onlineStatusImageView: UIImageView = {
        let imageView = UIImageView()
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
        setupCell(
            selectionStyle: .default,
            accessoryType: .disclosureIndicator
        )
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        descriptionNameLabel.text = nil
        descriptionValueTextView.text = nil
        onlineStatusImageView.image = nil
    }
    
    final func setupCellSubviews(
        descriptionName: String,
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
        descriptionNameLabel.text = descriptionName
        descriptionValueTextView.text = descriptionValue
    }
    
    final func setupCellSubviewsSafe() {
        onlineStatusImageView.image = nil
        descriptionNameLabel.text = .cellError
        descriptionValueTextView.text = .cellError
    }
    
    private func setupCell(
        selectionStyle: UITableViewCell.SelectionStyle,
        accessoryType: UITableViewCell.AccessoryType
    ) {
        self.selectionStyle = selectionStyle
        self.accessoryType = accessoryType
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

//MARK: - Constants
extension MainCatalogueTableViewCell {
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
