//
//  Boards.swift
//  GPUTracker
//
//  Created by Alexander on 02.04.2024.
//

import Foundation
import RealmSwift

class General: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var descriptionName: String = ""
    @objc dynamic var descriptionValue: String = ""

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
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

class SegaProductList: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var productName: String = ""
    @objc dynamic var shortDetails: String = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}






