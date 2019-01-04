//
//  Inventory.swift
//  ChemiLog
//
//  Created by Parker Swanson on 12/17/18.
//  Copyright © 2018 District196.org. All rights reserved.
//

import Foundation


var chemicals = [Chemical]()


func addChemical(chem: Chemical){
    
    chemicals.append(chem)
    
}

func removeChemical(chem: Chemical, chems: [Chemical]) -> [Chemical]{
    var chemicals = chems
    let contains = chemicals.contains(where: { $0 === chem })
    if contains == true{
        let i = chemicals.index{$0 === chem}
        chemicals.remove(at: i!)
            return chemicals
    } else {
        return chemicals
    }

    }


    

