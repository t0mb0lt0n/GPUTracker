//
//  DescriptionView.swift
//  GPUTracker
//
//  Created by Alexander on 10.05.2023.
//

import UIKit

class DescriptionView: UIView {
    
    let infoStackView = UIStackView()

    
    
    
    init() {
        super.init(frame: .zero)
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
        let itemsForStackView: [UIView] = [macBookItemCard,
                                         watchBandItemCard,
                                         macBookCaseItemCard,
                                         iPhoneItemCard]
        for item in itemsForStackView {
            stackView.addArrangedSubview(item)
            print("passed")
        }
    }
    
    private func setupConstraintsForStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollViewItems.topAnchor),
            stackView.heightAnchor.constraint(equalToConstant: scrollViewItems.contentSize.height),
            stackView.widthAnchor.constraint(equalToConstant: scrollViewItems.contentSize.width),
        ])
    }
}
