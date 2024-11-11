//
//  UIImage+Extension.swift
//  GPUTracker
//
//  Created by Alexander on 30.04.2024.
//

import UIKit

extension UIImage {
    static let onlineStatusImage = UIImage(named: "onlineStatusImage") ?? UIImage()
    static let offlineStatusImage = UIImage(named: "offlineStatusImage") ?? UIImage()
    static let partiallyAvailableStatusImage = UIImage(named: "offlineStatusImag") ?? UIImage()
    static let generalImage = UIImage(systemName: "building.columns.fill") ?? UIImage()
    static let consoleComponentsImage = UIImage(systemName: "scroll.fill") ?? UIImage()
    static let motherboardComponentsImage = UIImage(systemName: "wrench.and.screwdriver.fill") ?? UIImage()
}
