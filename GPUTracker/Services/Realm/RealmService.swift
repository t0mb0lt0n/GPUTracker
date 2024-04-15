//
//  RealmService.swift
//  GPUTracker
//
//  Created by Alexander on 01.04.2024.
//

import Foundation
import RealmSwift

final class RealmService {
    var data: Realm?
    //static let shared = RealmService()
    
    init(withConfigurationFor configuration: [String: Int] ) {
        let realmPath = Bundle.main.url(forResource: configuration[], withExtension: "realm")!
        var realmConfiguration = Realm.Configuration(fileURL: realmPath, readOnly: true)
        realmConfiguration.schemaVersion = UInt64(RealmConfigurations.configurations[configuration]!)
        let realm = try! Realm(configuration: realmConfiguration)
        let obj0 = realm.objects(Boards.self)
        print("boards ", obj0.count)
        data = realm
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
