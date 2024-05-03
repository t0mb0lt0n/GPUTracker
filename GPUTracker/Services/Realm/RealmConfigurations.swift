//
//  RealmConfigurations.swift
//  GPUTracker
//
//  Created by Alexander on 15.04.2024.
//

import Foundation

struct RealmConfigurations {
    static let itemIndexName: [[String]] = [
        [
        .xbox360Realm,
        .sonyRealm
        ],
        [
        .xbox360Realm,
        .sonyRealm
        ]
    ]
    static let schemas: [String: UInt64] = [
        .xbox360Realm: 68,
        .sonyRealm: 3,
        .mainProductListRealm: 9
    ]
}
