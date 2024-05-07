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
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        label.text = "Introduced"
        return label
    }()
    
    var onlineStatusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .onlineStatusImage
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
//    let itemImageView: UIImageView = {
//        let logoImageView = UIImageView()
//        let logoImage = UIImage(named: "xbox")
//        logoImageView.clipsToBounds = true
//        logoImageView.contentMode = .scaleAspectFill
//        logoImageView.image = logoImage
//        return logoImageView
//    }()
        
    let descriptionValueTextView: UITextView = {
        let label = UITextView(frame: CGRect(x: 150, y: 0, width: 100, height: 0))
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .systemGray
        label.text = "jkhjkhjklhjklhkljhkjlhkjhkjhjkhkjlhkjlhjkhkjlkljl;kj;lkj;ljkljlk;kll"
        label.isScrollEnabled = false
        //label.numberOfLines = 2
        label.isEditable = false
        return label
    }()
    
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
         //onlineStatusImageView
        ].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(subView)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            descriptionNameLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 0
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
                equalTo: contentView.topAnchor,
                constant: 0
            ),
            descriptionValueTextView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -15
            ),
            descriptionValueTextView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 150
            ),
            descriptionValueTextView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: 0
            ),
            
//            onlineStatusImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            onlineStatusImageView.widthAnchor.constraint(equalToConstant: 20),
//            onlineStatusImageView.heightAnchor.constraint(equalToConstant: 20),
//            //onlineStatusImageView.leadingAnchor.constraint(equalTo: descriptionNameLabel.trailingAnchor, constant: 10)
//            onlineStatusImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            onlineStatusImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
//MARK: - GPUInfoCellView extensions
extension MainCell {
    final func configurateCell(descriptionName: String?, descriptionValue: String?) {
        guard let descriptionName, let descriptionValue else { return }
        descriptionNameLabel.text = descriptionName
        descriptionValueTextView.text = descriptionValue
    }
}
