//
//  ClearRealm.swift
//  GPUTracker
//
//  Created by Alexander on 01.04.2024.
//

import Foundation
import RealmSwift

class ClearRealm {
    var emptyRealm = try! Realm()
    
    func createEmptyRealmFile() {
        let testRecord = TestTable(testValue: "Test Value written")
        try! emptyRealm.write {
            //Uncomment required
            emptyRealm.add(testRecord)
            ////emptyRealm.deleteAll()
        }
    }
}
