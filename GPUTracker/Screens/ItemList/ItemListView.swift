//
//  ItemListView.swift
//  GPUTracker
//
//  Created by Alexander on 04.04.2024.
//

import UIKit

final class ItemListView: UIView {
    let appLogoImageView: UIImageView = {
        let logoImageView = UIImageView()
        let logoImage = UIImage(named: "testLogo")
        logoImageView.backgroundColor = .gray
        logoImageView.clipsToBounds = true
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.image = logoImage
        return logoImageView
    }()
    
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "GPUTracker v0.9.1.0"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textAlignment = .center
        return label
    }()
    
    //MARK: init
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - MainView extensions
extension ItemListView {
    final private func setupView() {
        [appLogoImageView,
         appNameLabel
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    final private func setupConstraints() {
        NSLayoutConstraint.activate([
            appLogoImageView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 19
            ),
            appLogoImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 20),
            appLogoImageView.widthAnchor.constraint(equalToConstant: Constants.appLogoWidth),
            appLogoImageView.heightAnchor.constraint(equalToConstant: Constants.appLogoHeight),
            
            appNameLabel.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: Constants.appNameBottomPadding
            ),
            appNameLabel.leadingAnchor.constraint(
                equalTo: appLogoImageView.leadingAnchor,
                constant: Constants.appNameLabelLeadingOffsetConstant
            ),
            appNameLabel.heightAnchor.constraint(equalToConstant: Constants.appNameLabelHeight),
            appNameLabel.widthAnchor.constraint(equalToConstant: Constants.appNameLabelWidth)
        ])
    }
}

extension ItemListView {
    private enum Constants {
        static let appNameLabelTopOffsetConstant: CGFloat = -25
        static let appLogoHeight: CGFloat = 50
        static let appLogoWidth: CGFloat = 50
        static let appNameLabelHeight:  CGFloat = 20
        static let appNameLabelWidth: CGFloat = 200
        static let appNameLabelLeadingOffsetConstant: CGFloat = -35
        static let appNameBottomPadding: CGFloat = -10
    }
}
