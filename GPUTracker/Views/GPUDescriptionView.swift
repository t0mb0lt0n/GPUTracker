//
//  GPUDescriptionView.swift
//  GPUTracker
//
//  Created by Alexander on 05.05.2023.
//


import UIKit

class GPUDescriptionView: UIView {
    
    let appLogoImage: UIView = {
        let logo = UIView()
        let logoContainer = UIImageView(frame: CGRect(x: -10, y: -45, width: 155, height: 155))
        let logoImage = UIImage(named: "gpu3")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        logoContainer.image = logoImage
        logo.clipsToBounds = true
        logoContainer.contentMode = .scaleAspectFit
        logo.addSubview(logoContainer)
        return logo
    }()
    
    let gpuNameLabel: UILabel = {
        let label = UILabel()
        label.text = "empty"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    let vendorLabel: UILabel = {
        let label = UILabel()
        label.text = "empty"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    let gpuCoresLabel: UILabel = {
        let label = UILabel()
        label.text = "empty"
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

extension GPUDescriptionView {
    private func setupView() {
        let subViews: [UIView] = [appLogoImage, gpuNameLabel, gpuCoresLabel, vendorLabel]
        
        subViews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            appLogoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -30),
            appLogoImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            appLogoImage.widthAnchor.constraint(equalToConstant: 135),
            appLogoImage.heightAnchor.constraint(equalToConstant: 115),
            
            gpuNameLabel.topAnchor.constraint(equalTo: appLogoImage.bottomAnchor, constant: 50),
            gpuNameLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            gpuNameLabel.heightAnchor.constraint(equalToConstant: 20),
            gpuNameLabel.widthAnchor.constraint(equalToConstant: 200),
            
            gpuCoresLabel.topAnchor.constraint(equalTo: gpuNameLabel.bottomAnchor, constant: 25),
            gpuCoresLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 45),
            gpuCoresLabel.heightAnchor.constraint(equalToConstant: 20),
            gpuCoresLabel.widthAnchor.constraint(equalToConstant: 200),
            
            vendorLabel.topAnchor.constraint(equalTo: gpuCoresLabel.bottomAnchor, constant: 25),
            vendorLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 45),
            vendorLabel.heightAnchor.constraint(equalToConstant: 20),
            vendorLabel.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}
