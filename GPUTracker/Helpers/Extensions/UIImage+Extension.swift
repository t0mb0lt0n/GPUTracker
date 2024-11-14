//
//  UIImage+Extension.swift
//  GPUTracker
//
//  Created by Alexander on 30.04.2024.
//

import UIKit

extension UIImage {
    static let online = UIImage(named: "onlineStsImage") ?? UIImage()
    static let partiallyOnline = UIImage(named: "semiOnlineStsImage") ?? UIImage()
    static let offline = UIImage(named: "offlineStsImage") ?? UIImage()
    //static let partiallyAvailableStatusImage = UIImage(named: "offlineStatusImag.fill") ?? UIImage()
    
    static let generalImage = UIImage(
        systemName: "building.columns.fill"
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
    
    static let consoleComponentsImage = UIImage(
        systemName: "gearshape.fill"
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
    
    static let motherboardComponentsImage = UIImage(
        systemName: "wrench.and.screwdriver.fill"
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
    
    static let historyImage = UIImage(
        systemName: "scroll.fill"
    )?.withTintColor(
        .systemBlue,
        renderingMode: .alwaysOriginal
    ) ?? UIImage()
}
