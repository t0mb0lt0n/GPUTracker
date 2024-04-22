//
//  CustomDescriptionView.swift
//  GPUTracker
//
//  Created by Alexander on 05.04.2024.
//

import UIKit

final class CustomDescriptionView: UIView {
    var generalSegmentTableView = CustomTableView()
    var motherBoardsSegmentTableView = CustomTableView()
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private func addItemsToStackView() {
        let itemsForCellStackView: [UIView] = [
            generalSegmentTableView,
            motherBoardsSegmentTableView,
        ]
        itemsForCellStackView.forEach { horizontalStackView.addArrangedSubview($0) }
    }
    
    private func configurateHorizontalStackView(_ stackView: UIStackView) {
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing = 1
    }

            
    let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .lightGray
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsVerticalScrollIndicator = true
        //scrollView.contentInsetAdjustmentBehavior = .scrollableAxes
        scrollView.contentSize = CGSize(
            width: Int(UIScreen.main.bounds.width) * 5,
            height: 500
        )
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    func addSubviewsOnMainScrollView() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        //let h = mainScrollView.frame.height
//        table.frame = CGRect(
//            x: screenWidth * position,
//            y: 0,
//            width: screenWidth,
//            height: 1000
//        )
        generalSegmentTableView.translatesAutoresizingMaskIntoConstraints = false
        motherBoardsSegmentTableView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(generalSegmentTableView)
        mainScrollView.addSubview(motherBoardsSegmentTableView)

        NSLayoutConstraint.activate([
            generalSegmentTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            generalSegmentTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            //generalSegmentTableView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 0),
            generalSegmentTableView.widthAnchor.constraint(equalToConstant: screenWidth),
            generalSegmentTableView.widthAnchor.constraint(equalToConstant: screenHeight),
            
            motherBoardsSegmentTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            motherBoardsSegmentTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            motherBoardsSegmentTableView.widthAnchor.constraint(equalToConstant: screenWidth),
            motherBoardsSegmentTableView.widthAnchor.constraint(equalToConstant: screenHeight),
            motherBoardsSegmentTableView.leadingAnchor.constraint(equalTo: generalSegmentTableView.trailingAnchor),
        ])
        //mainScrollView.addSubview(ge)
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        generalSegmentTableView.backgroundColor = .secondarySystemBackground
        setupView()
        setupConstraints()
        addSubviewsOnMainScrollView()
        //addSubviewOnMainScrollView(position: 0, table: generalSegmentTableView)
        //addSubviewOnMainScrollView(position: 1, table: motherBoardsSegmentTableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    final private func setupView() {
        mainScrollView.isScrollEnabled = false
        generalSegmentTableView.tag = 0
        motherBoardsSegmentTableView.tag = 1
//        addSubviewOnMainScrollView(position: 0, table: generalSegmentTableView)
//        addSubviewOnMainScrollView(position: 1, table: motherBoardsSegmentTableView)
        [
        mainScrollView,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
//        addSubviewOnMainScrollView(position: 0, table: generalSegmentTableView)
//        addSubviewOnMainScrollView(position: 1, table: motherBoardsSegmentTableView)
    }
    
    final private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 0
            ),
            mainScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            horizontalStackView.heightAnchor.constraint(equalToConstant: mainScrollView.contentSize.height),
            horizontalStackView.wi.constraint(equalToConstant: mainScrollView.contentSize.height),
        ])
    }
}
