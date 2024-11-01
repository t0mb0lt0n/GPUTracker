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
                constant: 5
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
                constant: 10
            ),
            segmentedControll.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -10
            ),
        ])
    }
    
    @objc func segmentDidChanged() {
        segmentDidChangeClosure?()
    }
}

extension ItemDetailsView {
    private enum Constants {
        static let appNameLabelTopOffsetConstant: CGFloat = -25
        static let appLogoHeight: CGFloat = 50
        static let appLogoWidth: CGFloat = 50
        static let appNameLabelHeight:  CGFloat = 20
        static let appNameLabelWidth: CGFloat = 200
        static let appNameLabelLeadingOffsetConstant: CGFloat = -35
        static let appNameBottomPadding: CGFloat = -10
    }
}
