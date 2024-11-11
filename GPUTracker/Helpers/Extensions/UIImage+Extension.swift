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
    static let partiallyAvailableStatusImage = UIImage(named: "offlineStatusImage") ?? UIImage()
    static let generalImage = UIImage(systemName: "building.columns") ?? UIImage()
    static let consoleComponentsImage = UIImage(systemName: "gearshape") ?? UIImage()
    static let motherboardComponentsImage = UIImage(systemName: "cpu.fill") ?? UIImage()
}
