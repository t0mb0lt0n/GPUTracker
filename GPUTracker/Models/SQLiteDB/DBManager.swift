//
//  DBManager.swift
//  GPUTracker
//
//  Created by Alexander on 03.05.2023.
//

import Foundation
import SQLite

let prefixes = ["ID :",
                "Vendor :",
                "Cores :",
                "GPU Variant :",
                "TMUs :",
                "ROPs :",
                "L1 Cache :",
                "L2 Cache :",
                "Base CLK :",
                "Boost CLK :",
                "VRAM CLK :",
                "VRAM size :",
                "VRAM type :",
                "Bus width :",
                "TDP :",
                "PSU :",
                "DirectX :",
                "openGL :",
                "openCL :",
                "vulcan :",
                "CUDA :",
                "Shaders :",
                "Date: ",
                "Process: ",
                "Architecture: ",
                "fp32Float: ",
                "Foundry: ",
                "Crystal size: "]

func getSelectedGPUFields(fromTable table: String, with index: Int) -> [String: String] {
    var gpuFieldsData: [String: String] = [:]
    
    do {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!
        _ = copyDatabaseIfNeeded(sourcePath: Bundle.main.path(forResource: "gpuDB", ofType: "db")!)
        
        let db = try Connection("\(path)/gpuDB.db")
        let selectedTable = Table(table)
        ///Field requests to Rows
        let positionField       = Expression<Int>("position")
        let idField             = Expression<String>("id")
        let vendorField         = Expression<String>("vendor")
        let gpuCoresField       = Expression<String>("gpCores")
        let gpNameField         = Expression<String>("gpName")
        let tmusField           = Expression<String>("tmus")
        let ropsField           = Expression<String>("rops")
        let l1Field             = Expression<String>("l1")
        let l2Field             = Expression<String>("l2")
        let baseClockField      = Expression<String>("baseClock")
        let boostClockField     = Expression<String>("boostClock")
        let memClockField       = Expression<String>("memClock")
        let memSizeField        = Expression<String>("memorySize")
        let memTypeField        = Expression<String>("memType")
        let busField            = Expression<String>("bus")
        let tdpField            = Expression<String>("tdp")
        let psuField            = Expression<String>("psu")
        let directXField        = Expression<String>("directx")
        let openGLField         = Expression<String>("openGL")
        let openCLField         = Expression<String>("openCL")
        let vulcanField         = Expression<String>("vulcan")
        let cudaVersionField    = Expression<String>("cuda")
        let shaderModelField    = Expression<String>("shaderModel")
        let releaseDateField    = Expression<String>("releaseDate")
        let processSizeField    = Expression<String>("processSize")
        let architectureField   = Expression<String>("architecture")
        let fp32FloatField      = Expression<String>("fp32Float")
        let foundryField        = Expression<String>("foundry")
        let crystalSizeField    = Expression<String>("crystalSize")

//MARK: -transform records to Rows Array
        let arr = Array(try db.prepare(selectedTable))
        /// get field from array index
        gpuFieldsData = ["position"     : String(try arr[index].get(positionField)),
                         "id"           : try arr[index].get(idField),
                         "vendor"       : try arr[index].get(vendorField),
                         "gpuCores"     : try arr[index].get(gpuCoresField),
                         "gpName"       : try arr[index].get(gpNameField),
                         "tmus"         : try arr[index].get(tmusField),
                         "rops"         : try arr[index].get(ropsField),
                         "l1"           : try arr[index].get(l1Field),
                         "l2"           : try arr[index].get(l2Field),
                         "baseClock"    : try arr[index].get(baseClockField),
                         "boostClock"   : try arr[index].get(boostClockField),
                         "memClock"     : try arr[index].get(memClockField),
                         "memSize"      : try arr[index].get(memSizeField),
                         "memType"      : try arr[index].get(memTypeField),
                         "bus"          : try arr[index].get(busField),
                         "tdp"          : try arr[index].get(tdpField),
                         "psu"          : try arr[index].get(psuField),
                         "directx"      : try arr[index].get(directXField),
                         "openGL"       : try arr[index].get(openGLField),
                         "openCL"       : try arr[index].get(openCLField),
                         "vulcan"       : try arr[index].get(vulcanField),
                         "cuda"         : try arr[index].get(cudaVersionField),
                         "shaderModel"  : try arr[index].get(shaderModelField),
                         "releaseDate"  : try arr[index].get(releaseDateField),
                         "processSize"  : try arr[index].get(processSizeField),
                         "architecture" : try arr[index].get(architectureField),
                         "fp32Float"    : try arr[index].get(fp32FloatField),
                         "foundry"      : try arr[index].get(foundryField),
                         "crystalSize"  : try arr[index].get(crystalSizeField)]
    } catch {
        print(error.localizedDescription)
    }
    return gpuFieldsData
}

func getDataFromSelectedRow(from selectedGPUDict: [String : String]) -> [String?] {
    [selectedGPUDict["id"],
     selectedGPUDict["vendor"],
     selectedGPUDict["gpuCores"],
     selectedGPUDict["gpName"],
     selectedGPUDict["tmus"],
     selectedGPUDict["rops"],
     selectedGPUDict["l1"],
     selectedGPUDict["l2"],
     selectedGPUDict["baseClock"],
     selectedGPUDict["boostClock"],
     selectedGPUDict["memClock"],
     selectedGPUDict["memSize"],
     selectedGPUDict["memType"],
     selectedGPUDict["bus"],
     selectedGPUDict["tdp"],
     selectedGPUDict["psu"],
     selectedGPUDict["directx"],
     selectedGPUDict["openGL"],
     selectedGPUDict["openCL"],
     selectedGPUDict["vulcan"],
     selectedGPUDict["cuda"],
     selectedGPUDict["shaderModel"],
     selectedGPUDict["releaseDate"],
     selectedGPUDict["processSize"],
     selectedGPUDict["architecture"],
     selectedGPUDict["fp32Float"],
     selectedGPUDict["foundry"],
     selectedGPUDict["crystalSize"]]
}

func getDBRecordsCount(fromTable table: String) -> Int {
    var records: Int = 0
    do {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!
        _ = copyDatabaseIfNeeded(sourcePath: Bundle.main.path(forResource: "gpuDB", ofType: "db")!)
        
        let db = try Connection("\(path)/gpuDB.db")
        let selectedTable = Table(table)
        let arr = Array(try db.prepare(selectedTable))
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
