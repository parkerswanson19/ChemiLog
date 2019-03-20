//
//  persistentDataLab.swift
//  ChemiLog
//
//  Created by Parker Swanson on 3/1/19.
//  Copyright © 2019 District196.org. All rights reserved.
//
import Foundation
import os.log

class persistentDataLab: Codable{
    
    var persistentLabDate: [String]
    var persistentLabName: [String]
    var persistentClassName: [String]
    var persistentChemicalUsed: [String]
    var persistentQuantity: [Int]
    var persistentLabType: [Bool]
    var persistentNotify: [Bool]
    
    
    init(){
        
        persistentLabDate = ["2020"]
        persistentLabName = ["lab"]
        persistentClassName = ["class"]
        persistentChemicalUsed = ["chem"]
        persistentQuantity = [20]
        persistentLabType = [true]
        persistentNotify = [true]
        
    }
    
    func archive(fileName: String) {
        let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent(fileName)
        do {
            let encodedData = try PropertyListEncoder().encode(self)
            let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(encodedData, toFile: archiveURL.path)
            if isSuccessfulSave {
                os_log("Data successfully saved to file.", log: OSLog.default, type: .debug)
            } else {
                os_log("Failed to save data...", log: OSLog.default, type: .error)
            }
        } catch {
            os_log("Failed to save data...", log: OSLog.default, type: .error)
        }
    }
    /**
     * Recover the previously archived PersistentData object
     * @param: fileName from which to recover the previously archived file
     */
    func restore(fileName: String) {
        let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent(fileName)
        if let recoveredDataCoded = NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path) as? Data {
            do {
                // *** Replace "PersistentData" on the next line with the name of the class to be persistent. ***
                let recoveredData = try PropertyListDecoder().decode(persistentDataLab.self, from: recoveredDataCoded)
                os_log("Data successfully recovered from file.", log: OSLog.default, type: .debug)
                // *** Replace all the assignment statements BELOW to "restore" all properties of the object ***
                persistentLabDate = recoveredData.persistentLabDate
                persistentLabName = recoveredData.persistentLabName
                persistentLabType  = recoveredData.persistentLabType
                persistentNotify = recoveredData.persistentNotify
                persistentClassName = recoveredData.persistentClassName
                persistentChemicalUsed = recoveredData.persistentChemicalUsed
                persistentQuantity = recoveredData.persistentQuantity
                
                // *** Replace all the assignment statements ABOVE to "restore" all properties of the object ***
            } catch {
                os_log("Failed to recover data", log: OSLog.default, type: .error)
            }
        } else {
            os_log("Failed to recover data", log: OSLog.default, type: .error)
        }
    }
}

