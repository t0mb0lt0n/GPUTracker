//
//  UIImage+Extension.swift
//  GPUTracker
//
//  Created by Alexander on 30.04.2024.
//

import UIKit

extension UIImage {
    static let online = UIImage(named: "onlineStsImage") ?? UIImage()
    static let partially = UIImage(named: "partiallyStsImage") ?? UIImage()
    static let offline = UIImage(named: "offlineStsImage") ?? UIImage()
    
    static let generalImage = UIImage(
        systemName: "building.columns"
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
    
    static let consoleComponentsImage = UIImage(
        systemName: "gearshape"
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
    
    static let motherboardComponentsImage = UIImage(
        systemName: "wrench.and.screwdriver"
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
    
    static let controllersImage = UIImage(
        systemName: "gamecontroller"
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
}
