//
//  CoreDataManager.swift
//  GPUTracker
//
//  Created by Alexander on 28.04.2023.
//

import Foundation
import CoreData
import UIKit


 //MARK: -Create Read Update Delete (CRUD)

public final class CoreDataManager: NSObject {
    //create singleton for core data manager class
    public static let shared = CoreDataManager()
    //single init for singleton
    private override init() {}
    
    private var sceneDelegate: SceneDelegate {
        UIApplication.shared.delegate as! SceneDelegate
    }
    
    private var context: NSManagedObjectContext {
        sceneDelegate.persistantContainer.viewContext
    }

}


