//
//  UIViewController+Extensions.swift
//  GPUTracker
//
//  Created by Alexander on 01.11.2024.
//
import UIKit

extension UIViewController {
    final func setupNavigationBarStyle(
        isLarge: Bool,
        title: String?,
        titleColor: UIColor?
    ) {
        navigationController?.navigationBar.prefersLargeTitles = isLarge
        guard
            let title,
            let titleColor
        else
        { return }
        self.title = title
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: titleColor
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: titleColor
        ]
    }
}