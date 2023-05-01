//
//  GPU+CoreDataProperties.swift
//  GPUTracker
//
//  Created by Alexander on 01.05.2023.
//
//

import Foundation
import CoreData


extension GPU {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GPU> {
        return NSFetchRequest<GPU>(entityName: "GPU")
    }

    @NSManaged public var imageName: String?
    @NSManaged public var gpuName: String?
    @NSManaged public var date: Date?

}

extension GPU : Identifiable {

}
