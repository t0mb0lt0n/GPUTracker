//
//  DBManager.swift
//  GPUTracker
//
//  Created by Alexander on 03.05.2023.
//

import Foundation
import SQLite

func addGPU(vendor: String, id: Int, description: String) {
    do {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!
        _ = copyDatabaseIfNeeded(sourcePath: Bundle.main.path(forResource: "gpuDB", ofType: "db")!)

        let db = try Connection("\(path)/gpuDB.db")
        let amd = Table("AMD")
        let vendorField = Expression<String>("vendor")
        let descriptionField = Expression<String>("description")
        let idField = Expression<Int>("id")
        try db.run(amd.insert(vendorField <- vendor))
        try db.run(amd.insert(descriptionField <- description))
        try db.run(amd.insert(idField <- id))
    }
    catch {
        print(error.localizedDescription)
    }
}

func getFromDB() -> String {
    var result = ""
    do {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!
        _ = copyDatabaseIfNeeded(sourcePath: Bundle.main.path(forResource: "gpuDB", ofType: "db")!)

        let db = try Connection("\(path)/gpuDB.db")
        let gpu = Table("gpu")
        let vendor = Expression<String>("vendor")
        let description = Expression<String>("description")
        var result = ""
        
        //достать из базы
        for someVendor in try db.prepare(gpu.filter(vendor == "amd")) {
            //print("id: \(someVendor[vendor])")
            print(someVendor)
            //try someVendor.get(Expression<String>("vendor")).where { $0 == "AMD"}
        }
        
    
    }
    catch {
        print(error.localizedDescription)
    }
    return result
}



func copyDatabaseIfNeeded(sourcePath: String) -> Bool {
    let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let destinationPath = documents + "/gpuDB.db"
    let exists = FileManager.default.fileExists(atPath: destinationPath)
    guard !exists else { return false }
    do {
        try FileManager.default.copyItem(atPath: sourcePath, toPath: destinationPath)
        return true
    } catch {
      print("error during file copy: \(error)")
        return false
    }
}
