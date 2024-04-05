//
//  CustomDescriptionView.swift
//  GPUTracker
//
//  Created by Alexander on 05.04.2024.
//

import UIKit

final class CustomDescriptionView: UIView {
    var testLable1: UILabel = {
        let label = UILabel()
        label.text = "Test label text"
        label.backgroundColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .gray
        setupView()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    final private func setupView() {
        [
        testLable1,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    final private func setupConstraints() {
        NSLayoutConstraint.activate([
            testLable1.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            testLable1.widthAnchor.constraint(equalToConstant: 300),
            testLable1.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
}
