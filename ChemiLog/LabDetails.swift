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
    
    var activeTextField: UITextField!
    
    var id = 0
    
    @IBAction func reSubmitLab(_ sender: Any) {
        labList[id].labName = detailNameLab.text ?? "no"
        labList[id].labDate = detailLabDate.date
        labList[id].className = detailClassLab.text ?? "no"
       // labList[id].chemicalUsed = detailChemicalLab.
        labList[id].quantity = Int(detailAmountUsedLab.text ?? "no") ?? 0
        labList[id].notify = detailNotifyLab.isOn
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let center: NotificationCenter = NotificationCenter.default;
        center.addObserver(self, selector: #selector(keyboardDidShow(notification: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(notification: )), name: UIResponder.keyboardWillHideNotification, object: nil)
        detailAmountUsedLab.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
        detailAmountUsedLab.returnKeyType = .done
        detailNameLab.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
        detailNameLab.returnKeyType = .done
        detailClassLab.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
        detailClassLab.returnKeyType = .done
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
    @objc func keyboardDidShow(notification: Notification){
        print("SHOW ME")
        let info: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue.size
        let keyboardY = self.view.frame.size.height - keyboardSize.height
        let editingTextFieldY = self.activeTextField!.frame.origin.y
        
        if self.view.frame.origin.y >= 0 {
            print("Will move now")
            if editingTextFieldY > keyboardY - 60 {
                UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {self.view.frame = CGRect(x: 0, y: self.view.frame.origin.y - (editingTextFieldY - (keyboardY - 60)), width: self.view.bounds.width, height: self.view.bounds.height)}, completion: nil)
            }
            
        }
    }
    
    @objc func keyboardWillHide(notification: Notification){
        UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)}, completion: nil)
        print ("storyboard")
    }
    
    @objc func textFieldClicked(_ textField: UITextField){
        print("selected text field")
        activeTextField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @IBAction func detailNameResign(_ sender: Any) {
        detailNameLab.resignFirstResponder()
    }
    @IBAction func detailClassResign(_ sender: Any) {
        detailClassLab.resignFirstResponder()
    }
    @IBAction func detailAmountResign(_ sender: Any) {
        detailAmountUsedLab.resignFirstResponder()
    }
    
    
    
    
    
    
}


