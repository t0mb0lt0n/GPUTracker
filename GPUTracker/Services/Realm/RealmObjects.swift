//
//  Boards.swift
//  GPUTracker
//
//  Created by Alexander on 02.04.2024.
//

import Foundation
import RealmSwift

final class DeveloperList: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var developerName: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

final class General: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var descriptionName: String = ""
    @objc dynamic var descriptionValue: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

final class Components: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var descriptionName: String = ""
    @objc dynamic var descriptionValue: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

final class MotherboardComponents: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var descriptionName: String = ""
    @objc dynamic var descriptionValue: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

final class Controllers: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var descriptionName: String = ""
    @objc dynamic var descriptionValue: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

final class MicrosoftProductList: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var productName: String = ""
    @objc dynamic var shortDetails: String = ""
    @objc dynamic var onlineStatus: String = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

final class SonyProductList: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var productName: String = ""
    @objc dynamic var shortDetails: String = ""
    @objc dynamic var onlineStatus: String = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

final class SegaProductList: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var productName: String = ""
    @objc dynamic var shortDetails: String = ""
    @objc dynamic var onlineStatus: String = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}






