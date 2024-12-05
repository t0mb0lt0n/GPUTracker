//
//  RealmConfigurations.swift
//  GPUTracker
//
//  Created by Alexander on 15.04.2024.
//

import Foundation

struct RealmConfiguration {
    static let itemList: [[String]] = [
        [.xboxOriginal,
         .xbox360,
         .xbox360],
        [.playstation3,
         .playstation2,
         .playstation3,
         .playstation4]
    ]
    static let schemas: [String: UInt64] = [
        .mainProductListRealm: Constants.mainProductListSchema,
        .playstation3: Constants.palystation3Schema,
        .playstation2: Constants.palystation2Schema,
        .playstation4: Constants.palystation4Schema,
        .xbox360: Constants.xbox360Schema,
        .xboxOriginal: Constants.xboxOriginalSchema,
        
    ]
}

extension RealmConfiguration {
    private enum Constants {
        static let mainProductListSchema: UInt64 = 16
        static let palystation4Schema: UInt64 = 12
        static let palystation3Schema: UInt64 = 12
        static let palystation2Schema: UInt64 = 12
        static let xbox360Schema: UInt64 = 12
        static let xboxOriginalSchema: UInt64 = 12
    }
}
