//
//  DBManager.swift
//  GPUTracker
//
//  Created by Alexander on 03.05.2023.
//

import Foundation
import SQLite

func addGPU(add newVendor: String) {
    do {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!
        _ = copyDatabaseIfNeeded(sourcePath: Bundle.main.path(forResource: "gpuDB", ofType: "db")!)

        let db = try Connection("\(path)/gpuDB.db")
        let gpu = Table("gpu")
        let vendor = Expression<String>("vendor")
        
        try db.run(gpu.insert(vendor <- newVendor))
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
        var result = ""
        
        //достать из базы
        for someVendor in try db.prepare(gpu) {
            //print("id: \(someVendor[vendor])")
            print(try someVendor.get(vendor))
            //try someVendor.get(Expression<String>("vendor")).where { $0 == "AMD"}
        }
        
       
        //print(ab)
    
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
