//
//  CustomDescriptionView.swift
//  GPUTracker
//
//  Created by Alexander on 05.04.2024.
//

import UIKit

final class CustomDescriptionView: UIView {
    var testLable1: UILabel = {
        let label = UILabel()
        label.text = "Test label text"
        label.backgroundColor = .white
        return label
    }()
    
    let testScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .lightGray
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.bounces = true
        scrollView.contentSize = CGSize(width: Int(UIScreen.main.bounds.width) * 3, height: 1000)
        var testLable1: UILabel = {
            let label = UILabel()
            label.text = "Test label text"
            label.backgroundColor = .green
            return label
        }()
        scrollView.addSubview(testLable1)
        scrollView.isPagingEnabled = true
        
        

        return scrollView
    }()
    
    func addLabel(position: CGFloat) {
        let label = UILabel()
        label.text = "test text"
        label.textAlignment = .center
        label.backgroundColor = .white
        testScrollView.addSubview(label)
        let screeWith = UIScreen.main.bounds.width
        label.frame = CGRect(x: screeWith * position, y: 0, width: screeWith, height: 200)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .gray
        setupView()
        setupConstraints()
        addLabel(position: 0)
        addLabel(position: 1)
        addLabel(position: 2)
        addLabel(position: 3)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    final private func setupView() {
        [
        testLable1,
        testScrollView,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    final private func setupConstraints() {
        NSLayoutConstraint.activate([
            testLable1.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            testLable1.widthAnchor.constraint(equalToConstant: 300),
            testLable1.heightAnchor.constraint(equalToConstant: 50),
            
            testScrollView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 0
            ),
            testScrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            testScrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            testScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}

extension CustomDescriptionView: UIScrollViewDelegate {
    
}
