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
         .xbox360],
        [.playstation,
         .playstation2,
         .playstation3,
         .playstation4],
        [.dreamCast]
    ]
    static let schemas: [String: UInt64] = [
        .mainProductList: Constants.mainProductListSchema,
        .playstation: Constants.basicSelectedItemSchema,
        .playstation2: Constants.basicSelectedItemSchema,
        .playstation3: Constants.basicSelectedItemSchema,
        .playstation4: Constants.basicSelectedItemSchema,
        .xbox360: Constants.basicSelectedItemSchema,
        .xboxOriginal: Constants.basicSelectedItemSchema,
        .dreamCast: Constants.basicSelectedItemSchema
    ]
}

extension RealmConfiguration {
    private enum Constants {
        static let mainProductListSchema: UInt64 = 16
        static let basicSelectedItemSchema: UInt64 = 12
    }
}
