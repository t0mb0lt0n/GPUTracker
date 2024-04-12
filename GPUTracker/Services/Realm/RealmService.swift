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
    static let shared = RealmService()
    
    init() {
        let generalPath = Bundle.main.url(forResource: "microsoftTest_Schema66", withExtension: "realm")!
        var generalRealmConfiguration = Realm.Configuration(fileURL: generalPath, readOnly: true)
        generalRealmConfiguration.schemaVersion = 68
        let general = try! Realm(configuration: generalRealmConfiguration)
        let obj0 = general.objects(Boards.self)
        print("boards ", obj0.count)
        
        let boardsPath = Bundle.main.url(forResource: "local", withExtension: "realm")!
        var boardsRealmConfiguration = Realm.Configuration(fileURL: boardsPath, readOnly: true)
        boardsRealmConfiguration.schemaVersion = 28

        let boards = try! Realm(configuration: boardsRealmConfiguration)
        let obj = boards.objects(BoardRevision.self)
        print("boards ", obj.count)
        
        [
            general,
            boards
        ].forEach { realm in
            self.realms.append(realm)
        }
    }
}

//MARK: - Migration
//        var generalRealmConfiguration = Realm.Configuration(
//            schemaVersion: 29, // Увеличьте версию схемы
//            migrationBlock: { migration, oldSchemaVersion in
//                if oldSchemaVersion < 29 {
//                    // Выполните миграцию данных, если это необходимо
//                }
//            }
//        )
//
//        var boardsRealmConfiguration = Realm.Configuration(
//            schemaVersion: 29, // Увеличьте версию схемы
//            migrationBlock: { migration, oldSchemaVersion in
//                if oldSchemaVersion < 29 {
//                    // Выполните миграцию данных, если это необходимо
//                }
//            }
//        )
