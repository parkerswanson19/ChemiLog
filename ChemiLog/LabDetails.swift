//
//  LabDetails.swift
//  ChemiLog
//
//  Created by Maverick on 3/13/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation
import UIKit

class LabDetailsController: UIViewController{
    @IBOutlet weak var detailNameLab: UITextField!
    @IBOutlet weak var detailLabDate: UIDatePicker!
    @IBOutlet weak var detailClassLab: UITextField!
    @IBOutlet weak var detailChemicalLab: UIPickerView!
    @IBOutlet weak var detailAmountUsedLab: UITextField!
    @IBOutlet weak var detailNotifyLab: UISwitch!
    
    var detailNameLab2 = ""
    var detailLabDate2 = ""
    var detailClassLab2 = " "
    var detailChemicalLab2 = " "
    var detailAmountUsedLab2 = 10
    var detailNotifyLab2 = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailNameLab.text! = detailNameLab2
        //detailLabDate = detailLabDate2
        detailClassLab.text = detailClassLab2
        //detailChemicalLab = detailChemicalLab2
        detailAmountUsedLab.text! = String(detailAmountUsedLab2)
        detailNotifyLab.isOn = detailNotifyLab2
    }
}
