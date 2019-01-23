//
//  ManualAdd.swift
//  ChemiLog
//
//  Created by Maverick on 1/16/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation
import UIKit

class ManualAddController: UIViewController {
    @IBOutlet weak var nameIn: UITextField!
    @IBOutlet weak var catalogIn: UITextField!
    @IBOutlet weak var quantityIn: UITextField!
    @IBOutlet weak var lastRefillIn: UITextField!
    @IBOutlet weak var nextUseIn: UITextField!
    
    
    
    
    var newChem = Chemical.init(quantity: "", name: "", catalogNumber: "", lastRefill: "", nextRefill: "", usedLabs: "", icon: "", amount: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
