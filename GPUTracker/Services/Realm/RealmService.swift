//
//  RealmService.swift
//  GPUTracker
//
//  Created by Alexander on 01.04.2024.
//

import Foundation
import RealmSwift

final class RealmService {
    var realms = [Realm]()
    var objects: Results<General>
    var objects2: Results<BoardRev>

    static let shared = RealmService()
    
    init() {
//        var microsoftRealmConfiguration = Realm.Configuration(
//        schemaVersion: 68,
//        migrationBlock: { migration, oldSchemaVersion in
//            if (oldSchemaVersion < 68) {
//                // Nothing to do!
//                // Realm will automatically detect new properties and removed properties
//                // And will update the schema on disk automatically
//            }
//        })
        
        var microsoftRealmConfiguration = Realm.Configuration()
        let microsoftRealmPath = Bundle.main.url(forResource: "microsoftTest_Schema66", withExtension: "realm")!
        microsoftRealmConfiguration.seedFilePath = microsoftRealmPath
        microsoftRealmConfiguration.schemaVersion = 69
        let microsoftRealm = try! Realm(configuration: microsoftRealmConfiguration)
        objects = microsoftRealm.objects(General.self)
        print("obj", objects.count as Any)
        
        var microsoftRealmConfiguration2 = Realm.Configuration()
        let microsoftRealmPath2 = Bundle.main.url(forResource: "microsoftTest_V2", withExtension: "realm")!
        microsoftRealmConfiguration2.seedFilePath = microsoftRealmPath2
        //microsoftRealmConfiguration.schemaVersion = 69
        let microsoftRealm2 = try! Realm(configuration: microsoftRealmConfiguration2)
        objects2 = microsoftRealm2.objects(BoardRev.self)
        print("obj2", objects2.count as Any)


        [
        microsoftRealm,
        microsoftRealm2
        ].forEach { realm in
            self.realms.append(realm)
        }
    }
}



// microsoftRealmConfiguration.fileURL?.path = microsoftRealmPath
 //microsoftRealmConfiguration = Realm.Configuration(fileURL: microsoftRealmPath, readOnly: true)
//        //Realm.Configuration.defaultConfiguration = microsoftRealmConfiguration


//        var microsoftRealmConfiguration = Realm.Configuration(
//        schemaVersion: 68,
//        migrationBlock: { migration, oldSchemaVersion in
//            if (oldSchemaVersion < 68) {
//                // Nothing to do!
//                // Realm will automatically detect new properties and removed properties
//                // And will update the schema on disk automatically
//            }
//        })
