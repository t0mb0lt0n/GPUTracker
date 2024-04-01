//
//  DataService.swift
//  GPUTracker
//
//  Created by Alexander on 01.04.2024.
//

import Foundation
import RealmSwift

final class DataService {
    private var realm: Realm!
    var groupedItems: (table1: Results<RealmService>, table2: Results<Table2>)?
    
    init() {
        let realmPath = Bundle.main.url(forResource: "imported", withExtension: "realm")!
        let realmConfiguration = Realm.Configuration(fileURL: realmPath, readOnly: true)
        realm = try! Realm(configuration: realmConfiguration)
        groupedItems = generateItemsWithGroups()
    }
    
    private func generateItemsWithGroups() -> (Results<RealmService>, Results<Table2>) {
        (realm.objects(RealmService.self), realm.objects(Table2.self))
    }
}
