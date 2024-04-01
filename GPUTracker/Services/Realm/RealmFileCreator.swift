//
//  RealmFileCreator.swift
//  GPUTracker
//
//  Created by Alexander on 01.04.2024.
//

import RealmSwift

class RealmFileCreator {
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
