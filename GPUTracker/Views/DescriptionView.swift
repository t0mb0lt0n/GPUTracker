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
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 10
        return view
    }()

    
    
    
    init() {
        super.init(frame: .zero)
        setupStackView()
        setupConstraintsForStackView()
        addItemsToStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

extension DescriptionView {
    func setupStackView() {
        infoStackView.axis = .vertical
        infoStackView.distribution = .fillEqually
        infoStackView.alignment = .fill
        infoStackView.spacing = 10
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
    
    }
    
    private func addItemsToStackView() {
        let itemsForStackView: [UIView] = [infoView, infoView, infoView]
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
            infoStackView.widthAnchor.constraint(equalToConstant: 500),
        ])
    }
}
