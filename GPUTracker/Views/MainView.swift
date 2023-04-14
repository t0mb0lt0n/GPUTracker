//
//  MainView.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit

class MainView: UIView {
    let processorsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 29)
        label.text = "Vendors"
        label.backgroundColor = .white
        return label
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
        let subViews: [UIView] = [processorsLabel]
        
        subViews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            processorsLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            processorsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            processorsLabel.widthAnchor.constraint(equalToConstant: 110),
            processorsLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
