//
//  persistentData.swift
//  ChemiLog
//
//  Created by Parker Swanson on 1/25/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation
import os.log

class persistentData: Codable{
    
    var savedQuantity: [Int]
    var savedName: [String]
    var savedCatalogNumber: [String]
    var savedCatalogLink: [String]
    var savedLastRefill: [String]
    var savedNextRefill: [String]
    var savedUsedLabs: [String]
    var savedIcon: [String]
    var savedAmount: [Int]
    
    
    init(){
        
        savedQuantity = [1]
        savedName = ["pop"]
        savedCatalogNumber = ["b0238"]
        savedCatalogLink = ["lin"]
        savedLastRefill = ["then"]
        savedNextRefill = ["ya"]
        savedUsedLabs = ["those ones"]
        savedIcon =  ["yessir"]
        savedAmount = [3]

        
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
                let recoveredData = try PropertyListDecoder().decode(persistentData.self, from: recoveredDataCoded)
                os_log("Data successfully recovered from file.", log: OSLog.default, type: .debug)
                // *** Replace all the assignment statements BELOW to "restore" all properties of the object ***
                savedQuantity = recoveredData.savedQuantity
                savedName = recoveredData.savedName
                savedCatalogNumber = recoveredData.savedCatalogNumber
                savedCatalogLink = recoveredData.savedCatalogLink
                savedLastRefill = recoveredData.savedLastRefill
                savedNextRefill = recoveredData.savedNextRefill
                savedUsedLabs = recoveredData.savedUsedLabs
                savedIcon = recoveredData.savedIcon
                savedAmount = recoveredData.savedAmount
                
                // *** Replace all the assignment statements ABOVE to "restore" all properties of the object ***
            } catch {
                os_log("Failed to recover data", log: OSLog.default, type: .error)
            }
        } else {
            os_log("Failed to recover data", log: OSLog.default, type: .error)
        }
    }
}
