//
//  Chemical.swift
//  ChemiLog
//
//  Created by Parker Swanson on 12/14/18.
//  Copyright © 2018 District196.org. All rights reserved.
//

import Foundation

class Chemical{
    
    var quantity: Int
    var name: String
    var catalogNumber: String
    var catalogLink: String
    var lastRefill: String
    var nextRefill: String
    var usedLabs: String
    var icon: String
    var amount: Int
    
    init(quantity: Int, name: String, catalogNumber: String, lastRefill: String, nextRefill: String, usedLabs: String, icon: String, amount: Int){
        
        self.quantity = quantity
        self.name = name
        self.catalogNumber = catalogNumber
        self.lastRefill = lastRefill
        self.nextRefill = nextRefill
        self.usedLabs = usedLabs
        self.icon = icon
        self.amount = amount
        
        var url1: String
        var url2: String
        var url3: String
        url1 = "https://www.flinnsci.com/" + "\(amount)" + "-"
        url2 = name + "-" + "\(quantity)"
        url3 = "-ml/" + catalogNumber + "/"
        let url = url1 + url2 + url3
        
        self.catalogLink = url
        
    }
    
    /*func addAmount(amount: Int){
        self.quantity += amount
    }
    
    func subtractAmount(amount: Int){
        self.quantity -= amount
    }
*/
 
}
