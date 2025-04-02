//
//  ItemDetailsView.swift
//  GPUTracker
//
//  Created by Alexander on 04.04.2024.
//

import UIKit

final class ItemDetailsView: UIView {
    private let itemDescriptionView = CustomDescriptionView()
    private let segmentedControl = UISegmentedControl()
    private let sectionLine: UIView = {
        $0.backgroundColor = .systemGray5
        return $0
    }(UIView(frame: .zero))
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
        backgroundColor = .secondarySystemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        segmentedControl.selectedSegmentIndex = Constants.selectedSegmentIndex
        [
        segmentedControl,
        itemDescriptionView,
        sectionLine
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        segmentedControl.addTarget(
            self,
            action: #selector(segmentDidChange),
            for: .valueChanged
        )
    }
    
    private func segmentChanging() {
        let contentOffset = Int(
            itemDescriptionView.generalTableView.frame.width
        )
        let segmentIndex = segmentedControl.selectedSegmentIndex
        itemDescriptionView.mainScrollView.setContentOffset(
            CGPoint(
                x: contentOffset * segmentIndex,
                y: Constants.segmentedControlSelectionOffsetYAxis
            ),
            animated: true
        )
    }
    
    func setupItemDescriptionViewTableViews(
        withDelegate delegate: UITableViewDelegate,
        andDataSource dataSource: UITableViewDataSource
    ) {
        [
        itemDescriptionView.generalTableView,
        itemDescriptionView.consoleComponentsTableView,
        itemDescriptionView.motherboardComponentsTableView,
        itemDescriptionView.controllersTableView
        ].forEach { tableView in
            tableView.delegate = delegate
            tableView.dataSource = dataSource
        }
    }
    
    func setupSegmentedControl(
        with viewModel: [UIImage?],
        andInitialIndex initialSegmentIndex: Int
    ) {
        for (index, value) in viewModel.enumerated() {
            segmentedControl.insertSegment(
                with: value,
                at: index,
                animated: false
            )
        }
        segmentedControl.selectedSegmentIndex = initialSegmentIndex
    }
    
    func itemDescriptionViewTableViewsReloadData() {
        itemDescriptionView.generalTableView.reloadData()
        itemDescriptionView.consoleComponentsTableView.reloadData()
        itemDescriptionView.motherboardComponentsTableView.reloadData()
        itemDescriptionView.controllersTableView.reloadData()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            itemDescriptionView.topAnchor.constraint(
                equalTo: segmentedControl.bottomAnchor,
                constant: Constants.itemDescriptionViewTopInset
            ),
            itemDescriptionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            itemDescriptionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            itemDescriptionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            segmentedControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            segmentedControl.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.segmentedControlLeadingInset
            ),
            segmentedControl.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: Constants.segmentedControlTrailingInset
            ),
            
            sectionLine.topAnchor.constraint(
                equalTo: segmentedControl.bottomAnchor,
                constant: Constants.sectionLineTopInset
            ),
            sectionLine.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            sectionLine.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            sectionLine.heightAnchor.constraint(equalToConstant: Constants.sectionLineHeight)
        ])
    }
    
    @objc private func segmentDidChange() {
        segmentChanging()
    }
}

extension ItemDetailsView {
    private enum Constants {
        static let itemDescriptionViewTopInset: CGFloat = 10.0
        static let sectionLineTopInset: CGFloat = 10.0
        static let sectionLineHeight: CGFloat = 1.0
        static let segmentedControlLeadingInset: CGFloat = 10.0
        static let segmentedControlTrailingInset: CGFloat = -10.0
        static let selectedSegmentIndex: Int = 1
        static let segmentedControlSelectionOffsetYAxis: Int = 0
        static let fontSize: CGFloat = 17.0
        static let defaultNumberOfRowsInSection: Int = 0
    }
}
