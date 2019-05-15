//
//  LabDetails.swift
//  ChemiLog
//
//  Created by Maverick on 3/13/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation
import UIKit

var chemicalPickerSpot = 0

class LabDetailsController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var detailNameLab: UITextField!
    @IBOutlet weak var detailLabDate: UIDatePicker!
    @IBOutlet weak var detailClassLab: UITextField!
    @IBOutlet weak var detailChemicalLab: UIPickerView!
    @IBOutlet weak var detailAmountUsedLab: UITextField!
    @IBOutlet weak var detailNotifyLab: UISwitch!

    var persistentChemicals = persistentData()
    var detailNameLab2 = ""
    var detailLabDate2 : Date = Date.init()
    var detailClassLab2 = " "
    var detailChemicalLab2 = " "
    var detailAmountUsedLab2 = 10
    var detailNotifyLab2 = true
    var pickerData: [String] = [String]()
    var selectedChem = 0
    var place = 0
    var currDate = Date.init(timeIntervalSinceNow: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailChemicalLab.delegate = self
        self.detailChemicalLab.dataSource = self
        
        
        persistentChemicals.restore(fileName: "test1")
        if persistentChemicals.savedName.count > 0{
            for num in 0...persistentChemicals.savedName.count - 1{
                let persistentChemicalsNew = Chemical(quantity: persistentChemicals.savedQuantity[num], name: persistentChemicals.savedName[num], catalogNumber: persistentChemicals.savedCatalogNumber[num], lastRefill: persistentChemicals.savedLastRefill[num], nextRefill: persistentChemicals.savedNextRefill[num], usedLabs: persistentChemicals.savedUsedLabs[num], icon: persistentChemicals.savedIcon[num], amount: persistentChemicals.savedAmount[num])
                pickerData.append(persistentChemicalsNew.name)
            }
            print(pickerData)
            print(detailChemicalLab2)
        }
        
        

        
        for name in pickerData{
            
            if name == detailChemicalLab2.description {
                selectedChem = place
            }
            place = place + 1
        }
        
        detailNameLab.text! = detailNameLab2
        detailLabDate.setDate(detailLabDate2, animated: false)
        detailClassLab.text = detailClassLab2
        detailChemicalLab.selectRow(selectedChem, inComponent: 0, animated: true)
        detailAmountUsedLab.text! = String(detailAmountUsedLab2)
        detailNotifyLab.isOn = detailNotifyLab2
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    private func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]
    }
}


