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
        let logoImage = UIImage(named: "gpu3")?.withTintColor(.black, renderingMode: .alwaysOriginal)
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
            appLogoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -70),
            appLogoImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            appLogoImage.widthAnchor.constraint(equalToConstant: 170),
            appLogoImage.heightAnchor.constraint(equalToConstant: 170),
            
            appNameLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            appNameLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 45),
            appNameLabel.heightAnchor.constraint(equalToConstant: 20),
            appNameLabel.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}
