//
//  DataBase.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import Foundation
import UIKit

struct Vendor {
    let name: String
    let image: UIImage?
    let description: String
}


struct Source {
    static func generateVendors() -> [Vendor] {
        [.init(name: "Nvidia", image: .init(systemName: ImageName.cpu.rawValue), description: "Geforce"),
         .init(name: "AMD", image: .init(systemName: ImageName.cpuFill.rawValue), description: "Radeon")
        ]
    }
    
    static func generateVendorsWithGroups() -> [[Vendor]] {
        let nvidia = generateVendors().filter { $0.name == "Nvidia" }
        let amd = generateVendors().filter { $0.name == "AMD"}
        return [nvidia, amd]
    }
}

