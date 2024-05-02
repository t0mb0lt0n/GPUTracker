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
    
    init(withRealmName realmName: String) {
        guard let realmPath = Bundle.main.url(
            forResource: realmName,
            withExtension: "realm"
        ) else { return }
        
        let realmConfiguration = Realm.Configuration(
            fileURL: realmPath,
            readOnly: true,
            schemaVersion: RealmConfigurations.schemas[realmName] ?? Constants.defaultRealmSchemaVersion
        )
        let realm = try! Realm(configuration: realmConfiguration)
        data = realm
    }
}

extension RealmService {
    private enum Constants {
        static let defaultRealmSchemaVersion: UInt64 = 0
    }
}
