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
    var catalogNumber: Int
    var catalogLink: URL
    var lastRefill: Date
    var nextRefill: Date
    var usedLabs: [String]
    var icon: String
    
    init(quantity: Int, name: String, catalogNumber: Int, catalogLink: URL, lastRefill: Date, nextRefill: Date, usedLabs: [String], icon: String){
        
        self.quantity = quantity
        self.name = name
        self.catalogNumber = catalogNumber
        self.catalogLink = catalogLink
        self.lastRefill = lastRefill
        self.nextRefill = nextRefill
        self.usedLabs = usedLabs
        self.icon = icon
        
    }
    
    func addAmount(amount: Int){
        self.quantity += amount
    }
    
    func subtractAmount(amount: Int){
        self.quantity -= amount
    }
    
}
