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
    var detailLabDate2 : Date = Date.init()
    var detailClassLab2 = " "
    var detailChemicalLab2 = " "
    var detailAmountUsedLab2 = 10
    var detailNotifyLab2 = true
    
    var pickerData: [Chemical] = [Chemical]()
    override func viewDidLoad() {
        super.viewDidLoad()
        detailNameLab.text! = detailNameLab2
        detailLabDate.setDate(detailLabDate2, animated: false)
        detailClassLab.text = detailClassLab2
        //detailChemicalLab = detailChemicalLab2
        self.detailChemicalLab.delegate = (self as! UIPickerViewDelegate)
        self.detailChemicalLab.dataSource = (self as! UIPickerViewDataSource)
        
        
        detailAmountUsedLab.text! = String(detailAmountUsedLab2)
        detailNotifyLab.isOn = detailNotifyLab2
    }
}
