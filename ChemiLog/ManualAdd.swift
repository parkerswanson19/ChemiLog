//
//  ManualAdd.swift
//  ChemiLog
//
//  Created by Maverick on 1/16/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation
import UIKit

class ManualAddController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameIn: UITextField!
    @IBOutlet weak var catalogIn: UITextField!
    @IBOutlet weak var quantityIn: UITextField!
    @IBOutlet weak var lastRefillIn: UITextField!
    @IBOutlet weak var nextUseIn: UITextField!
    @IBOutlet weak var labUsedIn: UITextField!
    @IBOutlet weak var amountIn: UITextField!
    
    
    var activeTextField: UITextField!
    
    var newChem = Chemical.init(quantity: 20, name: "", catalogNumber: "b023", lastRefill: "", nextRefill: "", usedLabs: "", icon: "", amount: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let center: NotificationCenter = NotificationCenter.default;
        center.addObserver(self, selector: #selector(keyboardDidShow(notification: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(notification: )), name: UIResponder.keyboardWillHideNotification, object: nil)
        amountIn.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
        amountIn.returnKeyType = .done
        catalogIn.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
         catalogIn.returnKeyType = .done
        quantityIn.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
         quantityIn.returnKeyType = .done
        lastRefillIn.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
         lastRefillIn.returnKeyType = .done
        nextUseIn.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
         nextUseIn.returnKeyType = .done
        labUsedIn.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
         labUsedIn.returnKeyType = .done
        nameIn.addTarget(self, action: #selector(textFieldClicked(_:)), for: .touchDown)
         nameIn.returnKeyType = .done
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
    
    
    @IBAction func AmountInReturn(_ sender: Any) {
        amountIn.resignFirstResponder()
    }
    
    @IBAction func LabInReturn(_ sender: Any) {
        labUsedIn.resignFirstResponder()
    }
    @IBAction func QuantityInReturn(_ sender: Any) {
        quantityIn.resignFirstResponder()
    }
    @IBAction func LastRefillReturn(_ sender: Any) {
        lastRefillIn.resignFirstResponder()
    }
    @IBAction func nextUseReturn(_ sender: Any) {
        nextUseIn.resignFirstResponder()
    }
    @IBAction func NameInReturn(_ sender: Any) {
        nameIn.resignFirstResponder()
    }
    @IBAction func CatalogInReturn(_ sender: Any){
        catalogIn.resignFirstResponder()
    }
    
    
    
    
    
    
}
