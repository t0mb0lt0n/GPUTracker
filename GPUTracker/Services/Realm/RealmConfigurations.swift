//
//  RealmConfigurations.swift
//  GPUTracker
//
//  Created by Alexander on 15.04.2024.
//

import Foundation

struct RealmConfigurations {
    static let itemList: [[String]] = [
        [.playstation3,
         .playstation3],
        [.playstation3,
         .playstation3]
    ]
    static let schemas: [String: UInt64] = [
        .xbox360Realm: 68,
        .sonyRealm: 3,
        .mainProductListRealm: 10,
        .playstation3: 9
    ]
}
