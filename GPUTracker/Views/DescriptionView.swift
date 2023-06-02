//
//  DescriptionView.swift
//  GPUTracker
//
//  Created by Alexander on 10.05.2023.
//

import UIKit

class DescriptionView: UIView {
    let infoStackView = UIStackView()
    
    let infoView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        return view
    }()
    
    let infoView2: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = .orange
        view.layer.cornerRadius = 10
        return view
    }()
    
    let infoView3: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = 10
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
            infoView3.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    func setupStackView() {
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.sizeToFit()
        infoStackView.backgroundColor = .green
        infoStackView.axis = .vertical
        infoStackView.distribution = .fillEqually
        infoStackView.alignment = .fill
        //infoStackView.contentMode = .scaleToFill
        infoStackView.spacing = 39
        addItemsToStackView()
        setupConstraintsForStackView()
    }
    
    private func addItemsToStackView() {
        let itemsForStackView: [UIView] = [infoView, infoView2, infoView3]
        for item in itemsForStackView {
            infoStackView.addArrangedSubview(item)
            print("passed")
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
