//
//  GeneralCell.swift
//  GPUTracker
//
//  Created by Alexander on 09.04.2024.
//


import UIKit

final class GeneralCell: UITableViewCell {
    let descriptionNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.text = "Introduced"
        //label.backgroundColor = .yellow
        return label
    }()
    
//    let descriptionValueLabel: UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 15, weight: .regular)
//        label.textColor = .systemGray
//        label.text = "October 1990"
//        label.numberOfLines = 0
//        //label.textAlignment = .left
//        //label.lineBreakMode = .byWordWrapping
//        label.backgroundColor = .yellow
//        label.sizeToFit()
//        label.textAlignment = .left
//        //label.adjustsFontSizeToFitWidth = true
//        return label
//    }()
    
    let descriptionValueTextView: UITextView = {
        let label = UITextView()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemGray
        label.text = "October 1990"
        //label.numberOfLines = 0
        //label.textAlignment = .left
        //label.lineBreakMode = .byWordWrapping
        //label.backgroundColor = .yellow
        label.isScrollEnabled = false
        label.isEditable = false
       // label.sizeToFit()
        //label.textAlignment = .left
        //label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    //MARK: init
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
                equalTo: descriptionNameLabel.bottomAnchor,
                constant: 2
            ),
            descriptionValueTextView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 15
            ),
            descriptionValueTextView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -8
            ),
            descriptionValueTextView.heightAnchor.constraint(equalToConstant: 100),
            descriptionValueTextView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -15
            )
        ])
    }
}
//MARK: - GPUInfoCellView extensions
extension GeneralCell {
    final func configurateCell(descriptionName: String?, descriptionValue: String?) {
        guard let descriptionName, let descriptionValue else { return }
        descriptionNameLabel.text = descriptionName
        descriptionValueTextView.text = descriptionValue
    }
}
