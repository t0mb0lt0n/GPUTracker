//
//  DataBase.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit

struct Manufacturer {
    let name: String
    let image: UIImage?
    let description: String
}

struct Source {
    static func generateManufacturers() -> [Manufacturer] {
        [.init(name: "Nvidia",
               image: .init(systemName: "tray.full.fill")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal),
               description: "Gtx/Titan/Tesla processors"),
         .init(name: "AMD",
               image: .init(systemName: "tray.full.fill")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal),
               description: "R-Series/RX/Vega processors")]
    }
    
    static func generateManufacturersWithGroups() -> [[Manufacturer]] {
        let nvidia = generateManufacturers().filter { $0.name == "Nvidia" }
        let amd = generateManufacturers().filter { $0.name == "AMD"}
        return [nvidia, amd]
    }
}

