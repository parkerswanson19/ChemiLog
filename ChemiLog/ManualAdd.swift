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
    
    @objc func keyboardDidShow(notification: Notification){
        print ("Keyboard will show: \(notification.name.rawValue)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let center: NotificationCenter = NotificationCenter.default;
        center.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
        
    
}
