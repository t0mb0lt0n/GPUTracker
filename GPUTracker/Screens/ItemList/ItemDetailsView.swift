//
//  ItemDetailsView.swift
//  GPUTracker
//
//  Created by Alexander on 04.04.2024.
//

import UIKit

final class ItemDetailsView: UIView {
    let itemImageView: UIImageView = {
        let logoImageView = UIImageView()
        let logoImage = UIImage(named: "xbox360FatWhite")
        logoImageView.backgroundColor = .gray
        logoImageView.clipsToBounds = true
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.image = logoImage
        return logoImageView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let itemDescriotionView = CustomDescriptionView()
    
    let pageControl: UIPageControl = {
        //let
        let pageControl = UIPageControl()
        //pageControl.addSubview(<#T##UIView#>)
        pageControl.currentPage = 0
        //pageControl.setp
        return pageControl
    }()
    
    let itemNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Original Xbox 360"
        label.textColor = .black
        label.font = .systemFont(ofSize: 35, weight: .semibold)
        label.textAlignment = .left
        return label
    }()

    let segmentedControll: UISegmentedControl = {
        let items: [String] = [
            .common,
            .gpuVariants,
            .cpuVariants,
            .motherBoards,
            .otherComponents
        ]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    var segmentDidChangedClosure: (() -> Void)?
    
    //MARK: init
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ItemDetailsView extensions
extension ItemDetailsView {
    final private func setupView() {
        [
        itemImageView,
        itemNameLabel,
        segmentedControll,
        itemDescriotionView,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    final private func setupConstraints() {
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 0
            ),
            itemImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            itemImageView.widthAnchor.constraint(equalToConstant: 70),
            itemImageView.heightAnchor.constraint(equalToConstant: 105),
            
            segmentedControll.topAnchor.constraint(
                equalTo: itemImageView.bottomAnchor,
                constant: 10
            ),
            segmentedControll.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            segmentedControll.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            itemNameLabel.centerYAnchor.constraint(
                equalTo: itemImageView.centerYAnchor,
                constant: 0
            ),
            itemNameLabel.leadingAnchor.constraint(
                equalTo: itemImageView.trailingAnchor,
                constant: 20
            ),
            itemNameLabel.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: 20
            ),
            itemNameLabel.heightAnchor.constraint(equalToConstant: 55),
            
            itemDescriotionView.topAnchor.constraint(equalTo: segmentedControll.bottomAnchor, constant: 10),
            itemDescriotionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            itemDescriotionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            itemDescriotionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            
        ])
    }
}

Int(scrollView.contentOffset.x/UIScreen.main.bounds)

extension ItemDetailsView {
    private enum Constants {
        static let appNameLabelTopOffsetConstant: CGFloat = -25
        static let appLogoHeight: CGFloat = 50
        static let appLogoWidth: CGFloat = 50
        static let appNameLabelHeight:  CGFloat = 20
        static let appNameLabelWidth: CGFloat = 200
        static let appNameLabelLeadingOffsetConstant: CGFloat = -35
        static let appNameBottomPadding: CGFloat = -10
    }
}
