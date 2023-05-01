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
    
    //add object into DB
    public func createGPU(imageName: String, gpuName: String, date: Int, vendor: String) {
        guard let gpuEntity = NSEntityDescription.entity(forEntityName: "GPU", in: context) else { return }
        let gpu = GPU(entity: gpuEntity, insertInto: context)
        gpu.imageName = imageName
        gpu.gpuName = gpuName
        gpu.date = date
        gpu.vendor = vendor
        sceneDelegate.saveContext()
    }
    
    //get all GPUs
    public func fetchGPUs() -> [GPU] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GPU")
        do {
            return try context.fetch(fetchRequest) as! [GPU]
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    //read from DB (with name)
    public func fetch(with gpuName: String) -> GPU? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GPU")
        do {
            guard let gpus = try? context.fetch(fetchRequest) as? [GPU] else { return nil }
            return gpus.first(where: {$0.gpuName == gpuName})
        }
    }
    
    //update gpu description
    public func updateGPU(with gpuName: String, newDate: Int? = nil) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GPU")
        do {
            guard let gpus = try? context.fetch(fetchRequest) as? [GPU],
                  let gpu = gpus.first(where: { $0.gpuName == gpuName }) else { return }
            gpu.date = newDate ?? 0000
        }
        sceneDelegate.saveContext()
    }
    
    //delete all GPUs from DB
    public func deleteAll() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GPU")
        do {
            guard let gpus = try? context.fetch(fetchRequest) as? [GPU] else { return }
            gpus.forEach { context.delete($0) }
        }
        sceneDelegate.saveContext()
    }
    
    //delete GPU with name
    public func deleteWith(name gpuName: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GPU")
        do {
            guard let gpus = try? context.fetch(fetchRequest) as? [GPU],
                  let gpu = gpus.first(where: { $0.gpuName == gpuName }) else { return }
            context.delete(gpu)
        }
        sceneDelegate.saveContext()
    }
}


