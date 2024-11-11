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
                constant: Constants.itemDescriptionViewTopInset
            ),
            itemDescriptionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            itemDescriptionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            itemDescriptionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            segmentedControll.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            segmentedControll.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.segmentedControllLeadingInset
            ),
            segmentedControll.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: Constants.segmentedControllTrailingInset
            ),
            
            sectionLine.topAnchor.constraint(
                equalTo: segmentedControll.bottomAnchor,
                constant: Constants.sectionLineTopInset
            ),
            sectionLine.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            sectionLine.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            sectionLine.heightAnchor.constraint(equalToConstant: Constants.sectionLineHeight)
        ])
    }
    
    @objc func segmentDidChanged() {
        segmentDidChangeClosure?()
    }
}

extension ItemDetailsView {
    private enum Constants {
        static let itemDescriptionViewTopInset: CGFloat = 10
        static let sectionLineTopInset: CGFloat = 10
        static let sectionLineHeight: CGFloat = 1
        static let segmentedControllLeadingInset: CGFloat = 5
        static let segmentedControllTrailingInset: CGFloat = -5
    }
}
