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
        let realmPath = Bundle.main.url(forResource: realmName, withExtension: "realm")!
        var realmConfiguration = Realm.Configuration(fileURL: realmPath, readOnly: true)
        realmConfiguration.schemaVersion = RealmConfigurations.schemas[realmName] ?? 0
        let realm = try! Realm(configuration: realmConfiguration)
        let obj0 = realm.objects(Boards.self)
        print("inside \(obj0.count) objects")
        data = realm
    }
}
