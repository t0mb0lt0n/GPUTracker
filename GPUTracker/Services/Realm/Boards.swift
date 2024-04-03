//
//  Boards.swift
//  GPUTracker
//
//  Created by Alexander on 02.04.2024.
//

import Foundation
import RealmSwift

//class Boards: Object {
//    @Persisted var _id: Int
//    @Persisted var name: String
//
//    convenience init(testValue: Int) {
//        self.init()
//        _id = testValue
//        
//    }
//}

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

class Heatsink: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var target: String = ""
    @objc dynamic var type: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

class OriginalXbox360: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var configuration: String = ""
    @objc dynamic var Arcade: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

class OriginalXbox360Configurations: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var configuration: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

class RFBoard: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var boardName: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

class Revision: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var revisionList: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

class UnitComponents: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var board: Boards?
    @objc dynamic var boards: String = ""
    let b = List<Boards>()

    override static func primaryKey() -> String? {
        return "_id"
    }
}

class Xbox360EConfigurations: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var configuration: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}

class Xbox360SConfigurations: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var configuration: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}
