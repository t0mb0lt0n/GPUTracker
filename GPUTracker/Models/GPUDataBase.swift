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
        [.init(name: "Nvidia", image: .init(named: "database")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal), description: "Gtx/Titan/Tesla processors"),
         .init(name: "AMD", image: .init(named: "database")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal), description: "R-Series/RX/Vega processors")
        ]
    }
    
    static func generateVendorsWithGroups() -> [[Vendor]] {
        let nvidia = generateVendors().filter { $0.name == "Nvidia" }
        let amd = generateVendors().filter { $0.name == "AMD"}
        return [nvidia, amd]
    }
}

