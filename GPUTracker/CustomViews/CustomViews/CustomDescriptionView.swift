//
//  CustomDescriptionView.swift
//  GPUTracker
//
//  Created by Alexander on 05.04.2024.
//

import UIKit

final class CustomDescriptionView: UIView {
    let generalSegmentTableView = CustomTableView()
    let motherBoardsSegmentTableView = CustomTableView()
    let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.contentSize = CGSize(
            width: Int(UIScreen.main.bounds.width) * Constants.numberOfSegmets,
            height: Int(UIScreen.main.bounds.height)
        )
        scrollView.isPagingEnabled = true
        return scrollView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    final private func setupView() {
        mainScrollView.isScrollEnabled = false
        generalSegmentTableView.tag = 0
        //generalSegmentTableView.sectionHeaderHeight = .zero
        //generalSegmentTableView.separatorInset = UIEdgeInsets.zero
        //generalSegmentTableView.automaticallyAdjustsScrollIndicatorInsets = false
        //generalSegmentTableView.backgroundColor = .green
        //generalSegmentTableView.contentInsetAdjustmentBehavior = .never
        //generalSegmentTableView.sectionHeaderTopPadding = 0
        //generalSegmentTableView.style = .plain

        motherBoardsSegmentTableView.tag = 1
        generalSegmentTableView.alwaysBounceVertical = false
        motherBoardsSegmentTableView.alwaysBounceVertical = false
        [
        mainScrollView,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        [
        generalSegmentTableView,
        motherBoardsSegmentTableView,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            mainScrollView.addSubview($0)
        }
    }
    
    final private func setupConstraints() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            generalSegmentTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            generalSegmentTableView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            generalSegmentTableView.widthAnchor.constraint(equalToConstant: screenWidth),
            generalSegmentTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            motherBoardsSegmentTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            motherBoardsSegmentTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            motherBoardsSegmentTableView.widthAnchor.constraint(equalToConstant: screenWidth),
            motherBoardsSegmentTableView.heightAnchor.constraint(equalToConstant: screenHeight),
            motherBoardsSegmentTableView.leadingAnchor.constraint(equalTo: generalSegmentTableView.trailingAnchor),
        ])
    }
}

extension CustomDescriptionView {
    private enum Constants {
        static let numberOfSegmets: Int = 3
    }
}
