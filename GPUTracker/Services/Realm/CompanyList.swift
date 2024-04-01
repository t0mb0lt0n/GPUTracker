//
//  CompanyList.swift
//  GPUTracker
//
//  Created by Alexander on 01.04.2024.
//

import RealmSwift

class CompanyList: Object {
    @Persisted var _id: Int
    @Persisted var producer: String
    @Persisted var products:
    
    convenience init(testValue: String) {
        self.init()
        testField = testValue
    }
}
