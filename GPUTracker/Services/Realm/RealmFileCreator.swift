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
        let testRecord = SonyProductList(value: AnyObject.self)
        try! emptyRealm.write {
            //Uncomment if required
            emptyRealm.add(testRecord)
            emptyRealm.deleteAll()
        }
    }
}
