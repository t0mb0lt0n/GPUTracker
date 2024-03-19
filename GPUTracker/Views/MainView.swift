//
//  MainView.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit

final class MainView: UIView {
    enum Constants {
        static let appNameLabelTopOffsetConstant: CGFloat = -25
        static let appLogoHeight: CGFloat = 115
        static let appLogoWidth: CGFloat = 135
        static let appNameLabelHeight:  CGFloat = 20
        static let appNameLabelWidth: CGFloat = 200
        static let appNameLabelLeadingOffsetConstant: CGFloat = -35
        static let appNameBottomPadding: CGFloat = -10
    }
    
    let appLogoImage: UIView = {
        let logo = UIView()
        let logoContainer = UIImageView(
            frame: CGRect(
                x: -10,
                y: -45,
                width: 150,
                height: 150
            )
        )
        let logoImage = UIImage(
            named: "gpu3"
        )?.withTintColor(
            .black,
            renderingMode: .alwaysOriginal
        )
        logoContainer.image = logoImage
        logo.clipsToBounds = true
        logoContainer.contentMode = .scaleAspectFit
        logo.addSubview(logoContainer)
        return logo
    }()
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "GPUTracker v0.9.0.9"
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
        backgroundColor = .secondarySystemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - MainView extensions
extension MainView {
    final private func setupView() {
        [appLogoImage,
         appNameLabel
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    final private func setupConstraints() {
        NSLayoutConstraint.activate([
            appLogoImage.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: Constants.appNameLabelTopOffsetConstant
            ),
            appLogoImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            appLogoImage.widthAnchor.constraint(equalToConstant: Constants.appLogoWidth),
            appLogoImage.heightAnchor.constraint(equalToConstant: Constants.appLogoHeight),
            
            appNameLabel.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: Constants.appNameBottomPadding
            ),
            appNameLabel.leadingAnchor.constraint(
                equalTo: appLogoImage.leadingAnchor,
                constant: Constants.appNameLabelLeadingOffsetConstant
            ),
            appNameLabel.heightAnchor.constraint(equalToConstant: Constants.appNameLabelHeight),
            appNameLabel.widthAnchor.constraint(equalToConstant: Constants.appNameLabelWidth)
        ])
    }
}
