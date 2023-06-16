//
//  MainView.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit

class MainView: UIView {
    
    let appLogoImage: UIView = {
        let logo = UIView()
        let logoContainer = UIImageView(frame: CGRect(x: -10, y: -45, width: 150, height: 150))
        let logoImage = UIImage(named: "gpu3")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        logoContainer.image = logoImage
        logo.clipsToBounds = true
        logoContainer.contentMode = .scaleAspectFit
        logo.addSubview(logoContainer)
        return logo
    }()
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "GPUTracker v0.8.1"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textAlignment = .center
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

//MARK: -Extensions
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
            appLogoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -25),
            appLogoImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            appLogoImage.widthAnchor.constraint(equalToConstant: 135),
            appLogoImage.heightAnchor.constraint(equalToConstant: 115),
            
            appNameLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            appNameLabel.leadingAnchor.constraint(equalTo: appLogoImage.leadingAnchor, constant: -35),
            appNameLabel.heightAnchor.constraint(equalToConstant: 20),
            appNameLabel.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}
