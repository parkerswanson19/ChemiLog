//
//  Lab.swift
//  ChemiLog
//
//  Created by Parker Swanson on 2/14/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation


class Lab {
    var labDate: String
    var labName: String
    var className: String
    var chemicalUsed: String
    var quantity: Int
    var labType: Bool
    var notify: Bool
    
    init(labDate: String, labName: String, className: String, chemicalUsed: String, quantity: Int, labType: Bool, notify: Bool)
    {
        self.labDate = labDate
        self.labName = labName
        self.className = className
        self.chemicalUsed = chemicalUsed
        self.quantity = quantity
        self.labType = labType
        self.notify = notify
    }
}
