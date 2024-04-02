//
//  Boards.swift
//  GPUTracker
//
//  Created by Alexander on 02.04.2024.
//

import Foundation
import RealmSwift

class Boards: Object {
    @Persisted var _id: Int
    @Persisted var name: String

    convenience init(testValue: Int) {
        self.init()
        _id = testValue
        
    }
}
