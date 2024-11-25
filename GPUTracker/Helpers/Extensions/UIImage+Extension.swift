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
        systemName: "building.columns.fill"
    )?.withTintColor(
        .black,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
    
    static let consoleComponentsImage = UIImage(
        systemName: "gearshape.fill"
    )?.withTintColor(
        .black,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
    
    static let motherboardComponentsImage = UIImage(
        systemName: "wrench.and.screwdriver.fill"
    )?.withTintColor(
        .black,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
    
    static let motherboardComponentsImage2 = UIImage(
        named: "motherboardComponentsImage"
    )?.withTintColor(
        .black,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()

    static let controllersImage = UIImage(
        systemName: "gamecontroller.fill"
    )?.withTintColor(
        .black,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
}
