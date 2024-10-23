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
            weight: .regular
        )
        label.textColor = .black
        label.text = "Debug text"
        //label.backgroundColor = .red
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
            ofSize: 16,
            weight: .regular
        )
        textView.text = "debug text"
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isUserInteractionEnabled = false
        //textView.backgroundColor = .cyan
        textView.textContainer.lineFragmentPadding = 0
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
                constant: contentView.layoutMargins.right - 11
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
        static let descriptionNameLabelLeadingInset: CGFloat = 20
        static let descriptionNameLabelTrailingInset: CGFloat = -10
        static let onlineStatusImageViewWidth: CGFloat = 10
        static let onlineStatusImageViewHeight: CGFloat = 10
        static let descriptionValueTextViewLeftInset: CGFloat = 20
        static let descriptionValueTextViewTopInset: CGFloat = 2
        static let descriptionValueTextViewBottomInset: CGFloat = -5
    }
}
