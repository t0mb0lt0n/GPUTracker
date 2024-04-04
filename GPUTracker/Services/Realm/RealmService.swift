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
    //var microsoftRealm: Realm!
    //var sonyRealm: Realm!
    static let shared = RealmService()
    //var groupedItems: (table1: Results<RealmService>, table2: Results<Table2>)?
    
    init() {
        let microsoftRealmPath = Bundle.main.url(forResource: "microsoftTest_V2", withExtension: "realm")!
        var microsoftRealmConfiguration = Realm.Configuration(fileURL: microsoftRealmPath, readOnly: false)
        microsoftRealmConfiguration.schemaVersion = 57
        let microsoftRealm = try! Realm(configuration: microsoftRealmConfiguration)
        
        let product = microsoftRealm.objects(ProductList.self)
        print("hjkgdhjsgfhdsgfjhkds", product[0] as Any)
        
        
        let sonyRealmPath = Bundle.main.url(forResource: "sonyRealm", withExtension: "realm")!
        var sonyRealmConfiguration = Realm.Configuration(fileURL: sonyRealmPath, readOnly: false)
        sonyRealmConfiguration.schemaVersion = 57
        let sonyRealm = try! Realm(configuration: sonyRealmConfiguration)
        
        let product1 = sonyRealm.objects(ProductList.self)
        print("hjkgdhjsgfhdsgfjhkds", product1[0] as Any)
        
        [
        microsoftRealm,
        sonyRealm
        ].forEach { realm in
            self.realms.append(realm)
        }
 
    }
    
//    private func generateItemsWithGroups() -> (Results<RealmService>, Results<Table2>) {
//        return (realm.objects(RealmService.self), realm.objects(Table2.self))
//    }
}
