//
//  Table2.swift
//  GPUTracker
//
//  Created by Alexander on 22.03.2024.
//

import Foundation
import RealmSwift

class Table2: Object {
    @Persisted var table2: String
    
    convenience init(table2: String) {
        self.init()
        self.table2 = table2
    }
}
