//
//  FirstViewController.swift
//  ChemiLog
//
//  Created by HEDLUND, MAVERICK on 12/13/18.
//  Copyright © 2018 District196.org. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func newChem(_ sender: Any) {
        var myButton: UIButton?
        if !(myButton != nil){
        let img = UIImage(named: "flask")
        let myButton = UIButton(type: UIButton.ButtonType.custom)
        myButton.frame = CGRect.init(x: 15, y: 40, width: 100, height: 45)
        myButton.setImage(img, for: .normal)
        myButton.addTarget(self, action: Selector(("btnTouched:")), for:.touchUpInside)
        self.view.addSubview(myButton)
    }
    
    }
}

