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
        //try db.run(amd.insert(vendorField <- vendor, idField <- id, descriptionField <- description))
        try db.run(amd.insertMany(or: OnConflict.ignore, [vendorField <- "amd2"], [descriptionField <- "geoff@mac.com"], [idField <- 100]))
        //try db.run(amd.where(vendorField == "amd").update(descriptionField <- "some description"))
       // try db.run(amd.where(vendorField == "100").update(descriptionField <- "100"))
        //try db.run(amd.update(idField <- id))
        //try db.run(amd.update(descriptionField <- description))
        
    }
    catch {
        print(error.localizedDescription)
    }
    
    
   
    
    
    
}

func getFromDB()  {
    var result = ""
    do {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!
        _ = copyDatabaseIfNeeded(sourcePath: Bundle.main.path(forResource: "gpuDB", ofType: "db")!)

        let db = try Connection("\(path)/gpuDB.db")
        let gpu = Table("AMD")
        let vendor = Expression<String>("vendor")
        let description = Expression<String>("description")
        var result = ""

        //get data
        for someVendor in try db.prepare(gpu.filter(vendor == "amd")) {
            //print("id: \(someVendor[vendor])")
            print(someVendor)
           try someVendor.get(Expression<String>("vendor")).where { $0 == "AMD"}
      }


    }
    catch {
        print(error.localizedDescription)
    }
    
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
