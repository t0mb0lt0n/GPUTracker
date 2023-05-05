//
//  DataBase.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit
import SQLite3

struct Manufacturer {
    let name: String
    let image: UIImage?
    let description: String
}


struct Source {
    static func generateManufacturers() -> [Manufacturer] {
        [.init(name: "nvidia", image: .init(named: "database")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal), description: "Gtx/Titan/Tesla processors"),
         .init(name: "AMD", image: .init(named: "database")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal), description: "R-Series/RX/Vega processors")
        ]
    }
    
    static func generateManufacturersWithGroups() -> [[Manufacturer]] {
        let nvidia = generateManufacturers().filter { $0.name == "nvidia" }
        let amd = generateManufacturers().filter { $0.name == "AMD"}
        return [nvidia, amd]
    }
}
