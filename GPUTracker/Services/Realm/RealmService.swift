//
//  RealmService.swift
//  GPUTracker
//
//  Created by Alexander on 01.04.2024.
//

import Foundation
import RealmSwift

final class RealmService {
    private var realm: Realm!
    //var groupedItems: (table1: Results<RealmService>, table2: Results<Table2>)?
    
    init() {
        let realmPath = Bundle.main.url(forResource: "imported", withExtension: "realm")!
        let realmConfiguration = Realm.Configuration(fileURL: realmPath, readOnly: false)
        realm = try! Realm(configuration: realmConfiguration)
        //groupedItems = generateItemsWithGroups()
        //print(realm.objects(RealmService.self).count)
    }
    
//    private func generateItemsWithGroups() -> (Results<RealmService>, Results<Table2>) {
//        return (realm.objects(RealmService.self), realm.objects(Table2.self))
//    }
}
