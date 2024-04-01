//
//  DataService.swift
//  GPUTracker
//
//  Created by Alexander on 01.04.2024.
//

import Foundation
import RealmSwift

class DataService {
    var realm: Realm!
    
    init() {
        let realmPath = Bundle.main.url(forResource: "imported", withExtension: "realm")!
        let realmConfiguration = Realm.Configuration(fileURL: realmPath, readOnly: true)
        realm = try! Realm(configuration: realmConfiguration)
    }
        
    func generateGroupedItems() {
        
    }
    
    
}
