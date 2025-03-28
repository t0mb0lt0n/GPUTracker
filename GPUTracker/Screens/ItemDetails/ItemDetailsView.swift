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
    
    private let sectionLine: UIView = {
        $0.backgroundColor = .systemGray5
        return $0
    }(UIView(frame: .zero))
    
    //MARK: - init
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
        backgroundColor = .secondarySystemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    final private func setupView() {
        segmentedControll.selectedSegmentIndex = Constants.selectedSegmentIndex
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
        static let itemDescriptionViewTopInset: CGFloat = 10.0
        static let sectionLineTopInset: CGFloat = 10.0
        static let sectionLineHeight: CGFloat = 1.0
        static let segmentedControllLeadingInset: CGFloat = 10.0
        static let segmentedControllTrailingInset: CGFloat = -10.0
        static let selectedSegmentIndex: Int = 1
    }
}
