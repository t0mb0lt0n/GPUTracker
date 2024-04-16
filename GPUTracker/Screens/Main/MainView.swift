//
//  MainView.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit

final class MainView: UIView {
    
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

//MARK: - MainView extensions
extension MainView {
    final private func setupView() {
        [
        ].forEach {
            //$0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    final private func setupConstraints() {
        NSLayoutConstraint.activate([
        ])
    }
}

extension MainView {
    private enum Constants {
        static let appNameLabelTopOffsetConstant: CGFloat = -25
        static let appLogoHeight: CGFloat = 115
        static let appLogoWidth: CGFloat = 135
        static let appNameLabelHeight:  CGFloat = 20
        static let appNameLabelWidth: CGFloat = 200
        static let appNameLabelLeadingOffsetConstant: CGFloat = -35
        static let appNameBottomPadding: CGFloat = -10
    }
}
