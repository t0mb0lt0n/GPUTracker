//
//  CustomDescriptionView.swift
//  GPUTracker
//
//  Created by Alexander on 05.04.2024.
//

import UIKit

final class CustomDescriptionView: UIView {
    let generalTableView = CustomTableView()
    let consoleComponentsTableView = CustomTableView()
    let motherboardComponentsTableView = CustomTableView()
    let controllersTableView = CustomTableView()
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
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainScrollView)
        let tableViews = [generalTableView,
                          consoleComponentsTableView,
                          motherboardComponentsTableView,
                          controllersTableView
        ]
        for (index, value) in tableViews.enumerated() {
            value.tag = index
        }
        
        [
        generalTableView,
        consoleComponentsTableView,
        motherboardComponentsTableView
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            mainScrollView.addSubview($0)
        }
    }
    
    final private func setupConstraints() {
        let screenWidth = UIScreen.main.bounds.width
        _ = UIScreen.main.bounds.height
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            generalTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            generalTableView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            generalTableView.widthAnchor.constraint(equalToConstant: screenWidth),
            generalTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            consoleComponentsTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            consoleComponentsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            consoleComponentsTableView.widthAnchor.constraint(equalToConstant: screenWidth),
            consoleComponentsTableView.leadingAnchor.constraint(equalTo: generalTableView.trailingAnchor),
            
            motherboardComponentsTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            motherboardComponentsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            motherboardComponentsTableView.widthAnchor.constraint(equalToConstant: screenWidth),
            motherboardComponentsTableView.leadingAnchor.constraint(equalTo: consoleComponentsTableView.trailingAnchor),
        ])
    }
}

extension CustomDescriptionView {
    private enum Constants {
        static let numberOfSegmets: Int = 3
        static let generalTableViewTag = 0
        static let consoleComponentsTableViewTag = 1
        static let motherboardComponentsTableViewTag = 2
    }
}
