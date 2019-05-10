//
//  addLab.swift
//  ChemiLog
//
//  Created by Maverick on 3/1/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation
import UIKit
var pickerData: [String] = [String]()

class AddLabController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    
    @IBOutlet weak var nameIn: UITextField!
    @IBOutlet weak var dateIn: UIDatePicker!
    @IBOutlet weak var classIn: UITextField!
    @IBOutlet weak var chemicalIn: UIPickerView!
    @IBOutlet weak var amountIn: UITextField!
    @IBOutlet weak var notifyIn: UISwitch!
    
  
    var persistentChemicalsAdd = persistentData()

    var newLab = Lab.init(labDate: Date.init(), labName: "T##String", className: "T##String", chemicalUsed: " ", quantity: 2, labType: true, notify: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.chemicalIn.delegate = self
        self.chemicalIn.dataSource = self

        
        persistentChemicalsAdd.restore(fileName: "test1")
        if persistentChemicalsAdd.savedName.count > 0{
            for num in 0...persistentChemicalsAdd.savedName.count - 1{
                let persistentChemicalsNew = Chemical(quantity: persistentChemicalsAdd.savedQuantity[num], name: persistentChemicalsAdd.savedName[num], catalogNumber: persistentChemicalsAdd.savedCatalogNumber[num], lastRefill: persistentChemicalsAdd.savedLastRefill[num], nextRefill: persistentChemicalsAdd.savedNextRefill[num], usedLabs: persistentChemicalsAdd.savedUsedLabs[num], icon: persistentChemicalsAdd.savedIcon[num], amount: persistentChemicalsAdd.savedAmount[num])
                pickerData.append(persistentChemicalsNew.name)
            }
        }
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
