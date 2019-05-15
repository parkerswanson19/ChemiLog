//
//  ChemicalDetails.swift
//  ChemiLog
//
//  Created by Maverick on 1/23/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class ChemicalDetailsController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var activeTextField: UITextField!
   
    @IBOutlet weak var detailName: UITextField!
    @IBOutlet weak var detailQuantity: UITextField!
    @IBOutlet weak var detailCatalog: UITextField!
    @IBOutlet weak var detailLastRefill: UITextField!
    @IBOutlet weak var detailNextRefill: UITextField!
    @IBOutlet weak var detailPickerss: UIPickerView!    
    @IBOutlet weak var detailAmount: UITextField!
    
    
    var persistentLabs = persistentDataLab()
    var id = 0
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

    var persistentNewChemical = persistentData()
    var chemiList = [Chemical]()
    
    @IBAction func flinnCatalog(_ sender: Any) {
        let linky = detailCatalogLink2
        print(linky ?? 0)
        UIApplication.shared.open(linky!)
    }
    @IBAction func ReSubmitChemical(_ sender: Any) {
        chemicalList[id].name = detailName.text ?? "no work"
         chemicalList[id].quantity = Int(detailQuantity.text ?? "no") ?? 0
         chemicalList[id].catalogNumber = detailCatalog.text ?? "no"
         chemicalList[id].lastRefill = detailLastRefill.text ?? "no"
         chemicalList[id].nextRefill = detailNextRefill.text ?? "no"
         chemicalList[id].usedLabs = detailLabs.text ?? "no"
         chemicalList[id].amount = Int(detailAmount.text ?? "no") ?? 0
        persistentNewChemical.savedName[id] = chemicalList[id].name
        persistentNewChemical.savedQuantity[id] = chemicalList[id].quantity
        persistentNewChemical.savedCatalogNumber[id] = chemicalList[id].catalogNumber
        persistentNewChemical.savedLastRefill[id] = chemicalList[id].lastRefill
        persistentNewChemical.savedNextRefill[id] = chemicalList[id].nextRefill
        persistentNewChemical.savedUsedLabs[id] = chemicalList[id].usedLabs
        persistentNewChemical.savedAmount[id] = chemicalList[id].amount
        persistentNewChemical.archive(fileName: "test1")
    }
    
    
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
        persistentNewChemical.restore(fileName: "test1")
        if persistentNewChemical.savedName.count > 0{
            for num in 0...persistentNewChemical.savedName.count - 1{
                let persistentChemicalNew = Chemical(quantity: persistentNewChemical.savedQuantity[num], name: persistentNewChemical.savedName[num], catalogNumber: persistentNewChemical.savedCatalogNumber[num], lastRefill: persistentNewChemical.savedLastRefill[num], nextRefill: persistentNewChemical.savedNextRefill[num], usedLabs: persistentNewChemical.savedUsedLabs[num], icon: persistentNewChemical.savedIcon[num], amount: persistentNewChemical.savedAmount[num])
                chemiList.append(persistentChemicalNew)
            }
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
        let center: NotificationCenter = NotificationCenter.default;
        center.addObserver(self, selector: #selector(keyboardDidShow(notification: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(notification: )), name: UIResponder.keyboardWillHideNotification, object: nil)
        detailName.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
        detailName.returnKeyType = .done
        detailCatalog.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
        detailCatalog.returnKeyType = .done
        detailLastRefill.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
        detailLastRefill.returnKeyType = .done
        detailNextRefill.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
        detailNextRefill.returnKeyType = .done
        detailLabs.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
        detailLabs.returnKeyType = .done
        detailAmount.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
        detailAmount.returnKeyType = .done
        detailQuantity.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
        detailQuantity.returnKeyType = .done
        
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
    
    @IBAction func tapQuantity(_ sender: Any) {
        detailQuantity.resignFirstResponder()
    }
    @IBAction func tapCatalog(_ sender: Any) {
        detailCatalog.resignFirstResponder()
    }
    @IBAction func tapLastRefill(_ sender: Any) {
        detailLastRefill.resignFirstResponder()
    }
    @IBAction func tapNextRefill(_ sender: Any) {
        detailNextRefill.resignFirstResponder()
    }
    @IBAction func tapLab(_ sender: Any) {
        detailLabs.resignFirstResponder()
    }
    @IBAction func tapAmount(_ sender: Any) {
        detailAmount.resignFirstResponder()
    }
    @IBAction func tapName(_ sender: Any) {
        detailName.resignFirstResponder()
    }
    
    
    
    
    
    
    
    
}
