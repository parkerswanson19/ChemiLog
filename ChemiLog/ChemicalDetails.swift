//
//  ChemicalDetails.swift
//  ChemiLog
//
//  Created by Maverick on 1/23/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class ChemicalDetailsController: UIViewController{
    
    var activeTextField: UITextField!
   
    @IBOutlet weak var detailName: UITextField!
    @IBOutlet weak var detailQuantity: UITextField!
    @IBOutlet weak var detailCatalog: UITextField!
    @IBOutlet weak var detailLastRefill: UITextField!
    @IBOutlet weak var detailNextRefill: UITextField!
    @IBOutlet weak var detailLabs: UITextField!
    @IBOutlet weak var detailAmount: UITextField!
    
    var detailName2 = " "
    var detailQuantity2 = 100
    var detailCatalog2 = ""
    var detailLastRefill2 = ""
    var detailNextRefill2 = ""
    var detailLabs2 = " "
    var detailAmount2 = 1
    var detailCatalogLink2 = URL(string: "blah")
    
    @IBAction func flinnCatalog(_ sender: Any) {
        let linky = detailCatalogLink2
        print(linky ?? 0)
        UIApplication.shared.open(linky!)
    }
    //chemicalList.remove(at: indexPath.row)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(detailName2)
        detailName.text! = detailName2
        detailQuantity.text! = String(detailQuantity2)
        detailCatalog.text! = detailCatalog2
        detailLastRefill.text! = detailLastRefill2
        detailNextRefill.text! = detailNextRefill2
        detailLabs.text! = detailLabs2
        detailAmount.text! = String(detailAmount2)
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
