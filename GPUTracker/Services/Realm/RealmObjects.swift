//
//  Boards.swift
//  GPUTracker
//
//  Created by Alexander on 02.04.2024.
//

import Foundation
import RealmSwift

//class General: Object {
//    @objc dynamic var _id: Int = 0
//    @objc dynamic var descriptionName: String = ""
//    @objc dynamic var value: String = ""
//
//    override static func primaryKey() -> String? {
//        return "_id"
//    }
//}

class General: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var descriptionName: String = ""
    @objc dynamic var descriptionValue: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

class Components: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var descriptionName: String = ""
    @objc dynamic var descriptionValue: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

class MotherboardComponents: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var descriptionName: String = ""
    @objc dynamic var descriptionValue: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

class MicrosoftProductList: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var productName: String = ""
    @objc dynamic var shortDetails: String = ""
    @objc dynamic var onlineStatus: String = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

class SonyProductList: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var productName: String = ""
    @objc dynamic var shortDetails: String = ""
    @objc dynamic var onlineStatus: String = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

class SegaProductList: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var productName: String = ""
    @objc dynamic var shortDetails: String = ""
    @objc dynamic var onlineStatus: String = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}






