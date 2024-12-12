//
//  RealmService.swift
//  GPUTracker
//
//  Created by Alexander on 01.04.2024.
//

import Foundation
import RealmSwift

final class RealmService {
    var data: Realm
    
    init(withRealmName realmName: String) {
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

extension RealmService {
    private enum Constants {
        static let defaultRealmSchemaVersion: UInt64 = 0
    }
}
