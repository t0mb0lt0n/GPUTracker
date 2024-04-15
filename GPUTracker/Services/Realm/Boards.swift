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




