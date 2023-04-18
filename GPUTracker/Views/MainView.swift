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
        let logoImage = UIImage(named: "gpu.icon.main")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        logo.image = logoImage
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    

    
    //MARK: - init
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainView {
    private func setupView() {
        backgroundColor = .secondarySystemBackground
        let subViews: [UIView] = [appLogoImage]
        
        subViews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            appLogoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            appLogoImage.leadingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            appLogoImage.widthAnchor.constraint(equalToConstant: 100),
            appLogoImage.heightAnchor.constraint(equalToConstant: 200),
            
        ])
    }
}
