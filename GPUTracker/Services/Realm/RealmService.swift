//
//  RealmService.swift
//  GPUTracker
//
//  Created by Alexander on 01.04.2024.
//

import Foundation
import RealmSwift

final class RealmService {
    var microsoftRealm: Realm!
    var sonyRealm: Realm!
    static let shared = RealmService()
    //var groupedItems: (table1: Results<RealmService>, table2: Results<Table2>)?
    
    init() {
        let realmPath = Bundle.main.url(forResource: "microsoftTest_V2", withExtension: "realm")!
        var realmConfiguration = Realm.Configuration(fileURL: realmPath, readOnly: false)
        realmConfiguration.schemaVersion = 57
        microsoftRealm = try! Realm(configuration: realmConfiguration)
        
        let product = microsoftRealm.objects(ProductList.self)
        print("hjkgdhjsgfhdsgfjhkds", product[0] as Any)
 

//        //groupedItems = generateItemsWithGroups()
//        print(realm2.objects(Boards.self))
//        print(realm.objects(Boards.self))
    }
    
//    private func generateItemsWithGroups() -> (Results<RealmService>, Results<Table2>) {
//        return (realm.objects(RealmService.self), realm.objects(Table2.self))
//    }
}
