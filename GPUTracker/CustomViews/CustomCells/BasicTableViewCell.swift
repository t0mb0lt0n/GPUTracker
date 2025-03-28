//
//  UniversalCustomCell.swift
//  GPUTracker
//
//  Created by Alexander on 22.10.2024.
//

import UIKit

final class BasicTableViewCell: UITableViewCell {
    private let descriptionNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(
            ofSize: Constants.descriptionNameLabelFontSize,
            weight: .medium
        )
        label.textColor = .black
        return label
    }()
            
    private let descriptionValueTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.textColor = .systemGray
        textView.font = .systemFont(
            ofSize: Constants.descriptionValueLabelFontSize,
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
            accessoryType: .none
        )
        setupConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        descriptionNameLabel.text = nil
        descriptionValueTextView.text = nil
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell(
        selectionStyle: UITableViewCell.SelectionStyle,
        accessoryType: UITableViewCell.AccessoryType
    ) {
        self.selectionStyle = selectionStyle
        self.accessoryType = accessoryType
        isUserInteractionEnabled = false
        [
         descriptionNameLabel,
         descriptionValueTextView,
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
                equalTo: contentView.trailingAnchor,
                constant: Constants.descriptionNameLabelTrailingInset
            ),
            
            descriptionValueTextView.topAnchor.constraint(
                equalTo: descriptionNameLabel.bottomAnchor,
                constant: Constants.descriptionValueTextViewTopInset
            ),
            descriptionValueTextView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.descriptionValueTextViewRightInset
            ),
            descriptionValueTextView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.descriptionValueTextViewLeftInset
            ),
            descriptionValueTextView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Constants.descriptionValueTextViewBottomInset
            ),
        ])
    }
}
//MARK: - UniversalCustomCell extensions
extension BasicTableViewCell {
    final func setupCellSubviews(
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
extension BasicTableViewCell {
    private enum Constants {
        static let descriptionNameLabelLeadingInset: CGFloat = 20.0
        static let descriptionNameLabelTrailingInset: CGFloat = -2.0
        static let descriptionValueTextViewLeftInset: CGFloat = 20.0
        static let descriptionValueTextViewRightInset: CGFloat = -10.0
        static let descriptionValueTextViewTopInset: CGFloat = 2.0
        static let descriptionValueTextViewBottomInset: CGFloat = -5.0
        static let lineFragmentPadding: CGFloat = 0.0
        static let descriptionNameLabelFontSize: CGFloat = 17.0
        static let descriptionValueLabelFontSize: CGFloat = 16.0
    }
}
