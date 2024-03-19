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
        let testImage: UIImage? = UIImage(named: "square")
      return  [.init(
            name: "Nvidia",
            image: testImage,
            description: "Gtx/Titan/Tesla processors"
        ),
         .init(
            name: "AMD",
            image: testImage,
            description: "R-Series/RX/Vega processors"
         )
        ]
        //return []
    }
    
    static func generateManufacturersWithGroups() -> [[Manufacturer]] {
        let nvidia = generateManufacturers().filter { $0.name == "Nvidia" }
        let amd = generateManufacturers().filter { $0.name == "AMD"}
        return [nvidia, amd]
    }
}

