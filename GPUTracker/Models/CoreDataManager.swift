//
//  CoreDataManager.swift
//  GPUTracker
//
//  Created by Alexander on 28.04.2023.
//

import UIKit
import CoreData

class CoreDataManager: UICollectionViewCell {
    static let shared = CoreDataManager()
    private init() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var context: NSManagedObjectContext = {
        NSPersistentContainer.viewContext
    }()
}
