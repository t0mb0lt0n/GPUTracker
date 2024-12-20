//
//  SectionDescriptionTableViewCell.swift
//  GPUTracker
//
//  Created by Alexander on 20.12.2024.
//

import UIKit

final class SectionDescriptionTableViewCell: UITableViewCell {
    private let sectionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .generalImage
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
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
        descriptionValueLabel.text = nil
        sectionImageView.image = nil
    }
    
    private func setupCell(
        selectionStyle: UITableViewCell.SelectionStyle,
        accessoryType: UITableViewCell.AccessoryType
    ) {
        self.selectionStyle = selectionStyle
        self.accessoryType = accessoryType
        [
         descriptionValueLabel,
         sectionImageView
        ].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(subView)
        }
    }
        
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            descriptionValueLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.descriptionValueLabelTopInset
            ),
            descriptionValueLabel.leadingAnchor.constraint(
                equalTo: sectionImageView.trailingAnchor,
                constant: Constants.descriptionValueLabelLeftInset
            ),
            descriptionValueLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.descriptionValueLabelRightInset
            ),
            descriptionValueLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Constants.descriptionValueLabelBottomInset
            ),
            descriptionValueLabel.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            ),
            sectionImageView.widthAnchor.constraint(equalToConstant: Constants.sectionImageViewWidth),
            sectionImageView.heightAnchor.constraint(equalToConstant: Constants.sectionImageViewHeight),
            sectionImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            sectionImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            sectionImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.sectionImageViewLeftInset
            ),
        ])
    }
}
//MARK: - MainCell extensions
extension SectionDescriptionTableViewCell {
    final func setupCellSubviews(
        descriptionValue: String,
        sectionImage: UIImage
    ) {
        sectionImageView.image = sectionImage
        descriptionValueLabel.text = descriptionValue
    }
}

//MARK: - Constants
extension SectionDescriptionTableViewCell {
    private enum Constants {
        static let sectionImageViewWidth: CGFloat = 28.0
        static let sectionImageViewHeight: CGFloat = 28.0
        static let descriptionValueLabelLeftInset: CGFloat = 10
        static let descriptionValueLabelRightInset: CGFloat = -10
        static let sectionImageViewLeftInset: CGFloat = 10
        static let descriptionValueLabelTopInset: CGFloat = 2.0
        static let descriptionValueLabelBottomInset: CGFloat = -5.0
    }
}
