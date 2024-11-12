//
//  CustomDescriptionView.swift
//  GPUTracker
//
//  Created by Alexander on 05.04.2024.
//

import UIKit

final class CustomDescriptionView: UIView {
    let generalSegmentTableView = CustomTableView()
    let consoleComponentsSegmentTableView = CustomTableView()
    let motherboardComponentsSegmentTableView = CustomTableView()
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
        //generalSegmentTableView.backgroundColor = .white
        consoleComponentsSegmentTableView.tag = 1
        motherboardComponentsSegmentTableView.tag = 2
        generalSegmentTableView.alwaysBounceVertical = false
        consoleComponentsSegmentTableView.alwaysBounceVertical = false
        motherboardComponentsSegmentTableView.alwaysBounceVertical = false
        [
        mainScrollView,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        [
        generalSegmentTableView,
        consoleComponentsSegmentTableView,
        motherboardComponentsSegmentTableView
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
            
            consoleComponentsSegmentTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            consoleComponentsSegmentTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            consoleComponentsSegmentTableView.widthAnchor.constraint(equalToConstant: screenWidth),
            consoleComponentsSegmentTableView.heightAnchor.constraint(equalToConstant: screenHeight),
            consoleComponentsSegmentTableView.leadingAnchor.constraint(equalTo: generalSegmentTableView.trailingAnchor),
            
            motherboardComponentsSegmentTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            motherboardComponentsSegmentTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            motherboardComponentsSegmentTableView.widthAnchor.constraint(equalToConstant: screenWidth),
            motherboardComponentsSegmentTableView.heightAnchor.constraint(equalToConstant: screenHeight),
            motherboardComponentsSegmentTableView.leadingAnchor.constraint(equalTo: consoleComponentsSegmentTableView.trailingAnchor),

        ])
    }
}

extension CustomDescriptionView {
    private enum Constants {
        static let numberOfSegmets: Int = 3
    }
}
