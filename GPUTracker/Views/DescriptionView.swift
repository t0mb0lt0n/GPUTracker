//
//  DescriptionView.swift
//  GPUTracker
//
//  Created by Alexander on 10.05.2023.
//

import UIKit

class DescriptionView: UIView {
    let leftInfoStackView       = UIStackView()
    let centralInfoStackView    = UIStackView()
    let rightInfoStackView      = UIStackView()
    
    let idLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let vendorLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let gpuCoresLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        label.textAlignment = .center
        label.textColor = .lightText
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let gpuNameLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let tmusLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let ropsLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let lOneLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    

    
    let lTwoLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let baseClockLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let boostClockLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let memClockLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let memSizeLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let memTypeLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let busLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let tdpLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let psuLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let directXLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let openGLLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let openCLLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let vulcanLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let cudaLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let shaderLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.760201905, green: 0.9570156739, blue: 0.8181600242, alpha: 1)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    //MARK: - init
    init() {
        super.init(frame: .zero)
        addSubview(leftInfoStackView)
        addSubview(centralInfoStackView)
        addSubview(rightInfoStackView)
        setupStackViews()
        setupLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DescriptionView {
    
    func setupLabelConstraints() {

    }
    
    func setupStackViews() {
        leftInfoStackView.translatesAutoresizingMaskIntoConstraints     = false
        centralInfoStackView.translatesAutoresizingMaskIntoConstraints  = false
        rightInfoStackView.translatesAutoresizingMaskIntoConstraints    = false
        //left stackView cfg
        leftInfoStackView.axis            = .vertical
        leftInfoStackView.distribution    = .fillEqually
        leftInfoStackView.alignment       = .fill
        leftInfoStackView.spacing         = 5
        //central stackView cfg
        centralInfoStackView.axis            = .vertical
        centralInfoStackView.distribution    = .fillEqually
        centralInfoStackView.alignment       = .fill
        centralInfoStackView.spacing         = 5
        //right stackView cfg
        rightInfoStackView.axis            = .vertical
        rightInfoStackView.distribution    = .fillEqually
        rightInfoStackView.alignment       = .fill
        rightInfoStackView.spacing         = 5
        
        addItemsToStackView()
        setupConstraintsForStackView()
    }
    
    private func addItemsToStackView() {
        let itemsForLeftStackView: [UIView] = [idLabel,
                                               vendorLabel,
                                               gpuCoresLabel,
                                               gpuNameLabel,
                                               tmusLabel,
                                               ropsLabel,
                                               lOneLabel]
        
        let itemsForeCentralStackView: [UIView] = [lTwoLabel,
                                                   baseClockLabel,
                                                   boostClockLabel,
                                                   memClockLabel,
                                                   memSizeLabel,
                                                   memTypeLabel,
                                                   busLabel]
        
        let itemsForRightStackView: [UIView] = [tdpLabel,
                                                psuLabel,
                                                directXLabel,
                                                openGLLabel,
                                                openCLLabel,
                                                vulcanLabel,
                                                cudaLabel,
                                                shaderLabel]
        
        for item in itemsForLeftStackView {
            leftInfoStackView.addArrangedSubview(item)
            print("subView added")
        }
        
        for item in itemsForeCentralStackView {
            centralInfoStackView.addArrangedSubview(item)
        }
        
        for item in itemsForRightStackView {
            rightInfoStackView.addArrangedSubview(item)
        }
    }
    
    private func setupConstraintsForStackView() {
        leftInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftInfoStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            leftInfoStackView.heightAnchor.constraint(equalToConstant: 300),
            leftInfoStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 3),
            //leftInfoStackView.widthAnchor.constraint(equalToConstant: 20),
            leftInfoStackView.trailingAnchor.constraint(equalTo: centralInfoStackView.leadingAnchor, constant: -3),
            
            centralInfoStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            centralInfoStackView.heightAnchor.constraint(equalToConstant: 300),
            //centralInfoStackView.leadingAnchor.constraint(equalTo: leftInfoStackView.trailingAnchor, constant: 3),
            //centralInfoStackView.trailingAnchor.constraint(equalTo: rightInfoStackView.leadingAnchor, constant: -3),
            centralInfoStackView.widthAnchor.constraint(equalToConstant: 100),
            centralInfoStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            
            rightInfoStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            rightInfoStackView.heightAnchor.constraint(equalToConstant: 270),
            rightInfoStackView.leadingAnchor.constraint(equalTo: centralInfoStackView.trailingAnchor, constant: 3),
            rightInfoStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -3),
            //rightInfoStackView.widthAnchor.constraint(equalToConstant: 20),

        ])
    }
}
