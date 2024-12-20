//
//  SectionDescriptionTableViewCell.swift
//  GPUTracker
//
//  Created by Alexander on 20.12.2024.
//

import UIKit

final class SectionDescriptionTableViewCell: UITableViewCell {
    private let onlineStatusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .generalImage
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(
            ofSize: Constants.textViewFontSize,
            weight: .regular
        )
        //label.isScrollEnabled = false
        //label.isEditable = false
        label.isUserInteractionEnabled = false
        //label.textContainer.lineFragmentPadding = Constants.lineFragmentPadding
        //label.textContainerInset = .zero
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
            descriptionValueTextView.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            ),
            //onlineStatusImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            onlineStatusImageView.widthAnchor.constraint(equalToConstant: Constants.onlineStatusImageViewWidth),
            onlineStatusImageView.heightAnchor.constraint(equalToConstant: Constants.onlineStatusImageViewHeight),
            onlineStatusImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            onlineStatusImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            onlineStatusImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.onlineStatusImageViewLeftInset
            ),
        ])
    }
}
//MARK: - MainCell extensions
extension SectionDescriptionTableViewCell {
    final func configurateCell(
        descriptionValue: String,
        sectionImage: UIImage
    ) {
        onlineStatusImageView.image = sectionImage
        descriptionValueTextView.text = descriptionValue
    }
}

//MARK: - Constants
extension SectionDescriptionTableViewCell {
    private enum Constants {
        static let defaultTopSystemInset: CGFloat = 8.0
        static let onlineStatusImageViewWidth: CGFloat = 30.0
        static let onlineStatusImageViewHeight: CGFloat = 30.0
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
