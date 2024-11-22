//
//  RealmConfigurations.swift
//  GPUTracker
//
//  Created by Alexander on 15.04.2024.
//

import Foundation

struct RealmConfiguration {
    static let itemList: [[String]] = [
        [.playstation3,
         .playstation3],
        [.playstation3,
         .playstation2]
    ]
    static let schemas: [String: UInt64] = [
        .mainProductListRealm: Constants.mainProductListSchema,
        .playstation3: Constants.palystation3Schema,
        .playstation2: Constants.palystation2Schema
    ]
}

extension RealmConfiguration {
    private enum Constants {
        static let mainProductListSchema: UInt64 = 16
        static let palystation3Schema: UInt64 = 12
        static let palystation2Schema: UInt64 = 12
    }
}
