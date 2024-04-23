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
            
    let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .lightGray
        scrollView.contentSize = CGSize(
            width: Int(UIScreen.main.bounds.width) * 5,
            height: Int(UIScreen.main.bounds.height)
        )
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    func addSubviewsOnMainScrollView() {
//        let screenWidth = UIScreen.main.bounds.width
//        let screenHeight = UIScreen.main.bounds.height
//        generalSegmentTableView.translatesAutoresizingMaskIntoConstraints = false
//        motherBoardsSegmentTableView.translatesAutoresizingMaskIntoConstraints = false
//        mainScrollView.addSubview(generalSegmentTableView)
//        mainScrollView.addSubview(motherBoardsSegmentTableView)
//        NSLayoutConstraint.activate([
//            generalSegmentTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
//            //generalSegmentTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
//            generalSegmentTableView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
//            generalSegmentTableView.widthAnchor.constraint(equalToConstant: screenWidth),
//            generalSegmentTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
//
//            motherBoardsSegmentTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
//            motherBoardsSegmentTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
//            motherBoardsSegmentTableView.widthAnchor.constraint(equalToConstant: screenWidth),
//            motherBoardsSegmentTableView.heightAnchor.constraint(equalToConstant: screenHeight),
//            motherBoardsSegmentTableView.leadingAnchor.constraint(equalTo: generalSegmentTableView.trailingAnchor),
//        ])
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        generalSegmentTableView.backgroundColor = .secondarySystemBackground
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    final private func setupView() {
        mainScrollView.isScrollEnabled = false
        generalSegmentTableView.tag = 0
        motherBoardsSegmentTableView.tag = 1
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
