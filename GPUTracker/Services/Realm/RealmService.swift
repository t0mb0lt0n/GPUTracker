//
//  RealmService.swift
//  GPUTracker
//
//  Created by Alexander on 01.04.2024.
//

import Foundation
import RealmSwift

final class RealmService {
    private var realm1: Realm!
    private var realm2: Realm!
    public lazy var realmConfig: Realm.Configuration = {

        var config = Realm.Configuration()

        config.schemaVersion = 9 //the old code is 'config.schemaVersion = 1'

        config.migrationBlock = { newSchemaVersion, oldSchemaVersion in
            if oldSchemaVersion < 9 {}
            if oldSchemaVersion < 2 {}
            if oldSchemaVersion < 1 {}
        }
        return config
    }()
    
    func performRealmMigrations() {
            Realm.Configuration.defaultConfiguration = Realm.Configuration(
                schemaVersion: 0,
                migrationBlock: { migration, oldSchemaVersion in },
                deleteRealmIfMigrationNeeded: true
            )
            
            let _ = try! Realm()
        }


    //var groupedItems: (table1: Results<RealmService>, table2: Results<Table2>)?
    
    init() {
        let realmPath1 = Bundle.main.url(forResource: "microsoftTest_V1", withExtension: "realm")!
        var realmConfiguration1 = Realm.Configuration(fileURL: realmPath1, readOnly: false)
        realmConfiguration1.schemaVersion = 31
        realm2 = try! Realm(configuration: realmConfiguration1)
        
        let board1 = realm2.objects(DVDDrives.self)
        print("hjkgdhjsgfhdsgfjhkds", board1[0].revision?.revisionList)
    
        
        
    
        
        let realmPath2 = Bundle.main.url(forResource: "microsoftTest", withExtension: "realm")!
        var realmConfiguration2 = Realm.Configuration(fileURL: realmPath2, readOnly: false)
        //performRealmMigrations()
        realmConfiguration2.schemaVersion = 31
//        realmConfiguration2.migrationBlock = { newSchemaVersion, oldSchemaVersion in
//            if oldSchemaVersion < 2 {}
//            if oldSchemaVersion < 2 {}
//            if oldSchemaVersion < 1 {}
//        }

        realm2 = try! Realm(configuration: realmConfiguration2)
        
        let board = realm2.objects(DVDDrives.self)
        print(board[0].revision?.revisionList)
//        //groupedItems = generateItemsWithGroups()
//        print(realm2.objects(Boards.self))
//        print(realm.objects(Boards.self))
    }
    
//    private func generateItemsWithGroups() -> (Results<RealmService>, Results<Table2>) {
//        return (realm.objects(RealmService.self), realm.objects(Table2.self))
//    }
}
