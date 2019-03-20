//
//  addLab.swift
//  ChemiLog
//
//  Created by Maverick on 3/1/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation
import UIKit
class AddLabController: UIViewController{
    @IBOutlet weak var nameIn: UITextField!
    @IBOutlet weak var dateIn: UIDatePicker!
    @IBOutlet weak var classIn: UITextField!
    @IBOutlet weak var chemicalIn: UIPickerView!
    @IBOutlet weak var amountIn: UITextField!
    @IBOutlet weak var notifyIn: UISwitch!
    
    var newLab = Lab.init(labDate: Date.init(), labName: "T##String", className: "T##String", chemicalUsed: " ", quantity: 2, labType: true, notify: true)
}
