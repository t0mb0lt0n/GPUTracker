//
//  RealmService.swift
//  GPUTracker
//
//  Created by Alexander on 22.03.2024.
//

import Foundation
import RealmSwift

class RealmService: Object {
    @Persisted var vendorName: String = ""
    @Persisted var itemName: String = ""
    @Persisted var count: Int = 0
    
    convenience init(vendor: String, itemName: String, count: Int) {
        self.init()
        self.vendorName = vendor
        self.itemName = itemName
        self.count = count
    }
}

