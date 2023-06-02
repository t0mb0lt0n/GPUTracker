//
//  DescriptionView.swift
//  GPUTracker
//
//  Created by Alexander on 10.05.2023.
//

import UIKit

class DescriptionView: UIView {
    let infoStackView = UIStackView()
    
    let idView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "ID"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let vendorView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "Vendor"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let gpuCoresView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "gpuCores"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let gpuNameView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "gpuName"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let tmusView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "tmus"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let ropsView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "rops"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let lOneView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "l1"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let lTwoView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "l2"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let baseClockView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "rops"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    

    
    
    //MARK: - init
    init() {
        super.init(frame: .zero)
        addSubview(infoStackView)
        setupStackView()
        setupSubViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DescriptionView {
    func setupSubViewConstraints() {
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.widthAnchor.constraint(equalToConstant: 100),
            infoView2.widthAnchor.constraint(equalToConstant: 150),
            infoView3.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    func setupStackView() {
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.backgroundColor = .green
        infoStackView.axis = .vertical
        infoStackView.distribution = .fillEqually
        infoStackView.alignment = .center
        infoStackView.spacing = 39
        addItemsToStackView()
        setupConstraintsForStackView()
    }
    
    private func addItemsToStackView() {
        let itemsForStackView: [UIView] = [infoView, infoView2, infoView3]
        for item in itemsForStackView {
            infoStackView.addArrangedSubview(item)
            print("subView added")
        }
    }
    
    private func setupConstraintsForStackView() {
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            infoStackView.heightAnchor.constraint(equalToConstant: 500),
            infoStackView.widthAnchor.constraint(equalToConstant: 270),
            infoStackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        ])
    }
}
