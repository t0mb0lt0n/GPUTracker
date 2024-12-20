//
//  UICollectionViewCell+Extension.swift
//  GPUTracker
//
//  Created by Alexander on 17.12.2024.
//

import UIKit

extension UITableViewCell {
    class var defaultIdentifier: String {
        String(describing: self)
    }
    
    func setupCellSeparator(
        withSeparatorLeftInset leftInset: CGFloat,
        andSeparatorRightInset rightInset: CGFloat
    ) {
        self.separatorInset = UIEdgeInsets(
            top: Constants.separatorTopInset,
            left: leftInset,
            bottom: Constants.separatorBottomInset,
            right: rightInset
        )
    }
}

extension UITableViewCell {
    private enum Constants {
        static let separatorRightInset: CGFloat = 0.0
        static let separatorLeftInset: CGFloat = 30.0
        static let separatorTopInset: CGFloat = 0.0
        static let separatorBottomInset: CGFloat = 0.0
    }
}
