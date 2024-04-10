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
            
    let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .lightGray
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.bounces = true
        scrollView.contentSize = CGSize(width: Int(UIScreen.main.bounds.width) * 5, height: 1000)
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    func addSubviewOnMainScrollView(position: CGFloat, table: CustomTableView) {
        let screeWith = UIScreen.main.bounds.width - 20
        table.frame = CGRect(x: screeWith * position, y: 0, width: screeWith, height: 1100)
        mainScrollView.addSubview(table)
        table.reloadData()
    }

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
        motherBoardsSegmentTableView.tag = 1
        addSubviewOnMainScrollView(position: 0, table: generalSegmentTableView)
        addSubviewOnMainScrollView(position: 1, table: motherBoardsSegmentTableView)
        [
        mainScrollView,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
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
        ])
    }
}
