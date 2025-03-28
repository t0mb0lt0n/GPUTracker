//
//  UIImage+Extension.swift
//  GPUTracker
//
//  Created by Alexander on 30.04.2024.
//

import UIKit

extension UIImage {
    //MARK: - Online sts icons
    static let online = UIImage(
        systemName: .circleFill
    )?.withTintColor(
        .systemGreen,
        renderingMode: .alwaysOriginal
    )
    static let offline = UIImage(
        systemName: .circleFill
    )?.withTintColor(
        .systemRed,
        renderingMode: .alwaysOriginal
    )
    static let partially = UIImage(
        systemName: .circleFill
    )?.withTintColor(
        .systemOrange,
        renderingMode: .alwaysOriginal
    )
    
    //MARK: - Segmented controll icons
    static let generalImage = UIImage(
        systemName: .building
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    )
    static let consoleComponentsImage = UIImage(
        systemName: .gearshape
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    )
    static let motherboardComponentsImage = UIImage(
        systemName: .wrench
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    )
    static let controllersImage = UIImage(
        systemName: .gamecontroller
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    )
    //MARK: - Info button icon
    static let infoButtonImage = UIImage(
        systemName: .infoButtonIcon
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    )
    //MARK: - Dismiss button icon
    static let dismissButtonImage = UIImage(
        systemName: .dismissButtonIcon
    )?.withTintColor(
        .systemRed,
        renderingMode: .alwaysOriginal
    )
}
