//
//  MainView.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit

class MainView: UIView {
    
    let appLogoImage: UIImageView = {
        let logo = UIImageView()
        let logoImage = UIImage(named: "gpu.icon.main")?.withTintColor(.systemGray2, renderingMode: .alwaysOriginal)
        logo.image = logoImage
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "GPUTracker v0.1"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()
    

    
    //MARK: - init
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

extension MainView {
    private func setupView() {
        let subViews: [UIView] = [appLogoImage, appNameLabel]
        
        subViews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            appLogoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            appLogoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -12),
            appLogoImage.widthAnchor.constraint(equalToConstant: 170),
            appLogoImage.heightAnchor.constraint(equalToConstant: 75),
            
            appNameLabel.bottomAnchor.constraint(equalTo: appLogoImage.bottomAnchor),
            appNameLabel.leadingAnchor.constraint(equalTo: appLogoImage.trailingAnchor, constant: -5),
            appNameLabel.heightAnchor.constraint(equalToConstant: 20),
            appNameLabel.widthAnchor.constraint(equalToConstant: 200),
            
        ])
    }
}
