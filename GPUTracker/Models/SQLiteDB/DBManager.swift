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
        let amd = Table("Nvidia")
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
    
    do {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!
        _ = copyDatabaseIfNeeded(sourcePath: Bundle.main.path(forResource: "gpuDB", ofType: "db")!)

        let db = try Connection("\(path)/gpuDB.db")
        let nvidiaTable = Table("Nvidia")
        let idField = Expression<String>("id")
        let vendorField = Expression<String>("vendor")

        //let get = try nvidiaTable.get(idField)
        // option 2: transform results using `map()`
        
        let filtered1 = nvidiaTable.where(idField.like("GTX-780"))
        let filtered = nvidiaTable.where(vendorField == "amd")
        let mapRowIterator = try db.prepareRowIterator(nvidiaTable.where(idField.like("GTX-780")))
        let gpuIds = try mapRowIterator.map { $0[vendorField] }
        //print(type(of: mapRowIterator ))
       // let get = try nvidiaTable.get()
        
        for item in try db.prepare(nvidiaTable.filter(idField == "GTX-780")) {
            do {
                
               
                print("name: \(try item.get(idField))")
            } catch {
                // handle
            }
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