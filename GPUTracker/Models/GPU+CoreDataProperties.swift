//
//  GPU+CoreDataProperties.swift
//  GPUTracker
//
//  Created by Alexander on 01.05.2023.
//
//

import Foundation
import CoreData

@objc(GPU)
public class GPU: NSManagedObject {}

extension GPU {
    @NSManaged public var imageName: String?
    @NSManaged public var gpuName: String?
    @NSManaged public var date: Date?
    @NSManaged public var vendor: String?
}

extension GPU : Identifiable {}
