//
//  ChemicalDetails.swift
//  ChemiLog
//
//  Created by Maverick on 1/23/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class ChemicalDetailsController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
   
    @IBOutlet weak var detailName: UITextField!
    @IBOutlet weak var detailQuantity: UITextField!
    @IBOutlet weak var detailCatalog: UITextField!
    @IBOutlet weak var detailLastRefill: UITextField!
    @IBOutlet weak var detailNextRefill: UITextField!
    @IBOutlet weak var detailPickerss: UIPickerView!    
    @IBOutlet weak var detailAmount: UITextField!
    
    
    var persistentLabs = persistentDataLab()
    var detailName2 = " "
    var detailQuantity2 = 100
    var detailCatalog2 = ""
    var detailLastRefill2 = ""
    var detailNextRefill2 = ""
    var detailLabs2 = " "
    var detailAmount2 = 1
    var detailCatalogLink2 = URL(string: "blah")
    var pickerDataLabs2: [String] = [String]()
    var selectedLab = 0
    var place = 0

    
    @IBAction func flinnCatalog(_ sender: Any) {
        let linky = detailCatalogLink2
        print(linky ?? 0)
        UIApplication.shared.open(linky!)
    }
    //chemicalList.remove(at: indexPath.row)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailPickerss.delegate = self
        self.detailPickerss.dataSource = self
        
        persistentLabs.restore(fileName: "testLab")
        if persistentLabs.persistentClassName.count > 0{
            for num in 0...persistentLabs.persistentClassName.count - 1{
                let persistentLabPicker = Lab(labDate: persistentLabs.persistentLabDate[num], labName: persistentLabs.persistentLabName[num], className: persistentLabs.persistentClassName[num], chemicalUsed: persistentLabs.persistentChemicalUsed[num], quantity: persistentLabs.persistentQuantity[num], labType: persistentLabs.persistentLabType[num], notify: persistentLabs.persistentNotify[num])
                pickerDataLabs2.append(persistentLabPicker.labName)
            }
        }
        
        for name in pickerDataLabs2{
            
            if name == detailLabs2.description {
                selectedLab = place
            }
            place = place + 1
        }
        print(detailName2)
        detailName.text! = detailName2
        detailQuantity.text! = String(detailQuantity2)
        detailCatalog.text! = detailCatalog2
        detailLastRefill.text! = detailLastRefill2
        detailNextRefill.text! = detailNextRefill2
        detailPickerss.selectRow(selectedLab, inComponent: 0, animated: true)
        detailAmount.text! = String(detailAmount2)

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataLabs2.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    private func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerDataLabs2[row]
    }
}
