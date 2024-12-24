//
//  RealmService.swift
//  GPUTracker
//
//  Created by Alexander on 01.04.2024.
//

import Foundation
import RealmSwift

final class RealmService {
    private enum Constants {
        static let defaultRealmSchemaVersion: UInt64 = 0
    }
    
    var data: Realm?

    private let realmName: String
    private lazy var realmPath = Bundle.main.url(
        forResource: realmName,
        withExtension: .realmExtension
    )
    private lazy var realmConfiguration = Realm.Configuration(
        fileURL: realmPath,
        readOnly: true,
        schemaVersion: RealmConfiguration.schemas[realmName] ??
        Constants.defaultRealmSchemaVersion
    )
    
    static func createEmptyRealm() -> Realm {
        let emptyRealm = try! Realm()
        return emptyRealm
    }
    
    init(withRealmName realmName: String) {
        self.realmName = realmName
        let realmPath = Bundle.main.url(
            forResource: realmName,
            withExtension: .realmExtension
        )
        let realmConfiguration = Realm.Configuration(
            fileURL: realmPath,
            readOnly: true,
            schemaVersion: RealmConfiguration.schemas[realmName] ??
            Constants.defaultRealmSchemaVersion
        )
        lazy var realm = try! Realm(configuration: realmConfiguration)
        data = realm
    }
}
