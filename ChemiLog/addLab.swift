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
    
     var activeTextField: UITextField!
  
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
        let center: NotificationCenter = NotificationCenter.default;
        center.addObserver(self, selector: #selector(keyboardDidShow(notification: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(notification: )), name: UIResponder.keyboardWillHideNotification, object: nil)
        amountIn.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
        amountIn.returnKeyType = .done
        nameIn.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
        nameIn.returnKeyType = .done
        classIn.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
        classIn.returnKeyType = .done
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @IBAction func nameInResign(_ sender: Any) {
        nameIn.resignFirstResponder()
    }
    @IBAction func classInResign(_ sender: Any) {
        classIn.resignFirstResponder()
    }
    @IBAction func amountInResign(_ sender: Any) {
        amountIn.resignFirstResponder()
    }
    
    
    
    
}
