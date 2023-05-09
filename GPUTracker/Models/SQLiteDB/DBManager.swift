//
//  DBManager.swift
//  GPUTracker
//
//  Created by Alexander on 03.05.2023.
//

import Foundation
import SQLite

enum Fields: String {
    case position = "posotion"
    case id = "id"
    case vendor = "vendor"
}

struct SelectedItem {
    static var gpuCount: Int = {
        getAllDBRecords()
    }()
   
    
    
    
    
   
}

func getGPUFields(with index: IndexPath) -> [String: String] {
    var result: [String: String]
    do {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!
        _ = copyDatabaseIfNeeded(sourcePath: Bundle.main.path(forResource: "gpuDB", ofType: "db")!)
        
        let db = try Connection("\(path)/gpuDB.db")
        let nvidiaTable = Table("Nvidia")
        ///Field requests to Rows
        let positionField    = Expression<String>("position")
        let idField          = Expression<String>("id")
        let vendorField      = Expression<String>("vendor")
        let gpuCoresField    = Expression<String>("gpCores")
        let gpNameField      = Expression<String>("gpName")
        let tmusField        = Expression<String>("tmus")
        let ropsField        = Expression<String>("rops")
        let l1Field          = Expression<String>("l1")
        let l2Field          = Expression<String>("l2")
        let baseClockField   = Expression<String>("baseClock")
        let boostClockField  = Expression<String>("boostClock")
        let memClockField    = Expression<String>("memClock")
        let memTypeField     = Expression<String>("memType")
        let busField         = Expression<String>("bus")
        let tdpField         = Expression<String>("tdp")
        let psuField         = Expression<String>("psu")
        let directXField     = Expression<String>("directx")
        let openGLField      = Expression<String>("openGL")
        let openCLField      = Expression<String>("openCL")
        let vulcanField      = Expression<String>("vulcan")
        let cudaVersionField = Expression<String>("cuda")
        let shaderModelField = Expression<String>("shaderModel")
        let arr = Array(try db.prepare(nvidiaTable))
        
        let positionResult = try arr[index.row].get(positionField)
        let idResult = try arr[index.row].get(idField)
        let vendorResult = try arr[index.row].get(vendorField)
        let gpuCoresResult = try arr[index.row].get(gpuCoresField)
        let gpNameResult = try arr[index.row].get(gpNameField)
        let tmusResult = try arr[index.row].get(tmusField)
        let ropsResult = try arr[index.row].get(ropsField)
        let l1Result = try arr[index.row].get(l1Field)
        let l2Result = try arr[index.row].get(l2Field)
        let baseClockResult = try arr[index.row].get(baseClockField)
        let boostClockResult = try arr[index.row].get(boostClockField)
        let memClockResult = try arr[index.row].get(memClockField)
        let memTypeResult = try arr[index.row].get(memTypeField)
        let busResult = try arr[index.row].get(busField)
        let tdpResult = try arr[index.row].get(tdpField)
        let psuResult = try arr[index.row].get(psuField)
        let directXResult = try arr[index.row].get(directXField)
        let openCLResult = try arr[index.row].get(openCLField)
        let openGLonResult = try arr[index.row].get(openGLField)
        let vulcanResult = try arr[index.row].get(vulcanField)
        let cudaVersionResult = try arr[index.row].get(cudaVersionField)
        let sahderModelResult = try arr[index.row].get(shaderModelField)
        
        result = ["position": String(positionResult),
                  "id"      : idResult,
                  "vendor"  : vendorResult,
                  "gpuCores": gpuCoresResult,
                  "gpName"  : gpNameResult,
                  "tmus"    : tmusResult,
                  "rops"    : ropsResult,
                  ""
                            ]
    
        
    } catch {
        print(error.localizedDescription)
    }
    return data
}

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

func getAllDBRecords() -> Int {
    var records: Int = 0
    do {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!
        _ = copyDatabaseIfNeeded(sourcePath: Bundle.main.path(forResource: "gpuDB", ofType: "db")!)
        
        let db = try Connection("\(path)/gpuDB.db")
        let nvidiaTable = Table("Nvidia")
        let arr = Array(try db.prepare(nvidiaTable))
        records = arr.count
    }
    catch {
        print(error.localizedDescription)
    }
    return records
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
