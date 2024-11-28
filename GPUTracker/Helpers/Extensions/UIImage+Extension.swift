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
    ) ?? UIImage()
    
    static let offline = UIImage(
        systemName: .circleFill
    )?.withTintColor(
        .systemRed,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
    
    static let partially = UIImage(
        systemName: .circleFill
    )?.withTintColor(
        .systemOrange,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
    
    //MARK: - Segmented controll icons
    static let generalImage = UIImage(
        systemName: .building
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
    
    static let consoleComponentsImage = UIImage(
        systemName: .gearshape
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
    
    static let motherboardComponentsImage = UIImage(
        systemName: .wrench
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
    
    static let controllersImage = UIImage(
        systemName: .gamecontroller
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
}
