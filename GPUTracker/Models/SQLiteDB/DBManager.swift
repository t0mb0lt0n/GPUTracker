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

func getGPUFields(with index: Int) -> [String: String] {
    var gpuFieldsData: [String: String] = [:]
    do {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!
        _ = copyDatabaseIfNeeded(sourcePath: Bundle.main.path(forResource: "gpuDB", ofType: "db")!)
        
        let db = try Connection("\(path)/gpuDB.db")
        let nvidiaTable = Table("Nvidia")
        ///Field requests to Rows
        let positionField    = Expression<Int>("position")
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
        let memSizeField     = Expression<String>("memorySize")
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
    
        
        let queries = [//Expression<Int>("position"),
                       Expression<String>("id"),
                       Expression<String>("vendor"),
                       Expression<String>("gpCores"),
                       Expression<String>("gpName"),
                       Expression<String>("tmus"),
                       Expression<String>("rops"),
                       Expression<String>("l1"),
                       Expression<String>("l2"),
                       Expression<String>("baseClock"),
                       Expression<String>("boostClock"),
                       Expression<String>("memClock"),
                       Expression<String>("memorySize"),
                       Expression<String>("memType"),
                       Expression<String>("bus"),
                       Expression<String>("tdp"),
                       Expression<String>("psu"),
                       Expression<String>("directx"),
                       Expression<String>("openGL"),
                       Expression<String>("openCL"),
                       Expression<String>("vulcan"),
                       Expression<String>("cuda"),
                       Expression<String>("shaderModel") ] as [Expression<String>]
        
        //transform records to Rows Array
        let arr = Array(try db.prepare(nvidiaTable))
        // Fields results
        let positionResult    = try arr[index].get(positionField)
        let idResult          = try arr[index].get(idField)
        let vendorResult      = try arr[index].get(vendorField)
        let gpuCoresResult    = try arr[index].get(gpuCoresField)
        let gpNameResult      = try arr[index].get(gpNameField)
        let tmusResult        = try arr[index].get(tmusField)
        let ropsResult        = try arr[index].get(ropsField)
        let l1Result          = try arr[index].get(l1Field)
        let l2Result          = try arr[index].get(l2Field)
        let baseClockResult   = try arr[index].get(baseClockField)
        let boostClockResult  = try arr[index].get(boostClockField)
        let memClockResult    = try arr[index].get(memClockField)
        let memSizeResult     = try arr[index].get(memSizeField)
        let memTypeResult     = try arr[index].get(memTypeField)
        let busResult         = try arr[index].get(busField)
        let tdpResult         = try arr[index].get(tdpField)
        let psuResult         = try arr[index].get(psuField)
        let directXResult     = try arr[index].get(directXField)
        let openCLResult      = try arr[index].get(openCLField)
        let openGLResult      = try arr[index].get(openGLField)
        let vulcanResult      = try arr[index].get(vulcanField)
        let cudaVersionResult = try arr[index].get(cudaVersionField)
        let shaderModelResult = try arr[index].get(shaderModelField)
        
        gpuFieldsData = ["position"    : String(positionResult),
                         "id"          : idResult,
                         "vendor"      : vendorResult,
                         "gpuCores"    : gpuCoresResult,
                         "gpName"      : gpNameResult,
                         "tmus"        : tmusResult,
                         "rops"        : ropsResult,
                         "l1"          : l1Result,
                         "l2"          : l2Result,
                         "baseClock"   : baseClockResult,
                         "boostClock"  : boostClockResult,
                         "memClock"    : memClockResult,
                         "memSize"     : memSizeResult,
                         "memType"     : memTypeResult,
                         "bus"         : busResult,
                         "tdp"         : tdpResult,
                         "psu"         : psuResult,
                         "directx"     : directXResult,
                         "openGL"      : openGLResult,
                         "openCL"      : openCLResult,
                         "vulcan"      : vulcanResult,
                         "cuda"        : cudaVersionResult,
                         "shaderModel" : shaderModelResult ]
    } catch {
        print(error.localizedDescription)
    }
    return gpuFieldsData
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
