//
//  DataBase.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import Foundation
import UIKit

enum ImageName: String {
    case cpu = "cpu"
    case cpuFill = "cpu.fill"
}

let logoImage: [UIImage?] = [UIImage(systemName: ImageName.cpu.rawValue), UIImage(systemName: ImageName.cpuFill.rawValue)]
