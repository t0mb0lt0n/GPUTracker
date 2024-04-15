//
//  Boards.swift
//  GPUTracker
//
//  Created by Alexander on 02.04.2024.
//

import Foundation
import RealmSwift

class AnalogChip: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var usedIn: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

class ProductList: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var shortDescription: String = ""

    enum CodingKeys: String, CodingKey {
        case shortDescription = "description"
    }
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

class GeneralTestDescription: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var descriptionName: String = ""
    @objc dynamic var descriptionValue1: String = ""
    @objc dynamic var descriptionValue2: String = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

class General: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var descriptionName: String = ""
    @objc dynamic var value: String = ""

    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

class BoardRevision: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var boardName: String = ""
    @objc dynamic var value: String = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}


class Boards: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var revison: String = ""
    @objc dynamic var hdmi: Bool = false
    @objc dynamic var boardName: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

class DVDDrives: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var driveName: String = ""
    @objc dynamic var revision: Revision?

    override static func primaryKey() -> String? {
        return "_id"
    }
}

class Fans: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var vendorName: String = ""
    @objc dynamic var fanConfiguration: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

class GPU: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var processSize: String = ""
    @objc dynamic var name: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

class Heatsink: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var target: String = ""
    @objc dynamic var type: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

class NAND: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var size: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}






