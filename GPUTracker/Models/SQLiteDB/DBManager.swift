//
//  DBManager.swift
//  GPUTracker
//
//  Created by Alexander on 03.05.2023.
//

import Foundation
import SQLite


func getGPU(withName gpuID: String ) -> (Int, String, Int) {
    var gpuName = 0
    var vendor = "empty"
    var gpuCores = 0
    var gpuCount = 0
    do {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!
        _ = copyDatabaseIfNeeded(sourcePath: Bundle.main.path(forResource: "gpuDB", ofType: "db")!)

        let db = try Connection("\(path)/gpuDB.db")
        let nvidiaTable = Table("Nvidia")
        let idField = Expression<String>("id")
        let vendorField = Expression<String>("vendor")
        let gpuCoresField = Expression<Int>("gpCores")
        let positionField = Expression<Int>("position")
        let arr = Array(try db.prepare(nvidiaTable))

        //let get = try nvidiaTable.get(idField)
        // option 2: transform results using `map()`
//        
//        let filtered1 = nvidiaTable.where(idField.like("GTX-780"))
//        let filtered = nvidiaTable.where(vendorField == "amd")
//        let mapRowIterator = try db.prepareRowIterator(nvidiaTable.where(idField.like("GTX-780")))
//        let gpuIds = try mapRowIterator.map { $0[vendorField] }
      
    
        for item in try db.prepare(nvidiaTable.filter(idField == gpuID)) {
            do {
                gpuName = try item.get(idField).count
                vendor = try item.get(vendorField)
                gpuCores = try item.get(gpuCoresField)
                gpuCount += 1
                print(try arr[0].get(vendorField))
            }
        }
    }
    catch {
        print(error.localizedDescription)
    }
    
    return (gpuName, vendor, gpuCores)
}


//MARK: - copy DB func (required)
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
