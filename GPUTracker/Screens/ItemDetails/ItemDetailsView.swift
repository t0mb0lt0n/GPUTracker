//
//  ItemDetailsView.swift
//  GPUTracker
//
//  Created by Alexander on 04.04.2024.
//

import UIKit

final class ItemDetailsView: UIView {
    let itemDescriptionView = CustomDescriptionView()
    let segmentedControll = UISegmentedControl()
    var segmentDidChangeClosure: (() -> Void)?
    
    let sectionLine:  UIView = {
        let line = UIView(frame: .zero)
        line.backgroundColor = .systemGray5
        return line
    }()
    
    //MARK: init
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

//MARK: - ItemDetailsView extensions
extension ItemDetailsView {
    final private func setupView() {
        segmentedControll.selectedSegmentIndex = 0
        [
        segmentedControll,
        itemDescriptionView,
        sectionLine
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        segmentedControll.addTarget(
            self,
            action: #selector(segmentDidChanged),
            for: .valueChanged
        )
    }
    
    final private func setupConstraints() {
        NSLayoutConstraint.activate([
            itemDescriptionView.topAnchor.constraint(
                equalTo: segmentedControll.bottomAnchor,
                constant: 10
            ),
            itemDescriptionView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 0
            ),
            itemDescriptionView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: 0
            ),
            itemDescriptionView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: 0
            ),
            
            segmentedControll.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 0
            ),
            segmentedControll.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 5
            ),
            segmentedControll.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -5
            ),
            
            sectionLine.topAnchor.constraint(
                equalTo: segmentedControll.bottomAnchor,
                constant: 10
            ),
            sectionLine.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 0
            ),
            sectionLine.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: 0
            ),
            sectionLine.heightAnchor.constraint(equalToConstant: 1)
            
            
        ])
    }
    
    @objc func segmentDidChanged() {
        segmentDidChangeClosure?()
    }
}

extension ItemDetailsView {
    private enum Constants {
        static let appNameLabelTopOffsetConstant: CGFloat = 99
    }
}
