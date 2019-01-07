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

    var buttons: [UIButton] = []
    var xAxis = 10
    let yAxis = 10
    
    @IBAction func newChem(_ sender: Any) {
        if (buttons.count == 0){
        let img = UIImage(named: "chemical-icon-png-6_25x25")
        let myButton = UIButton(type: UIButton.ButtonType.custom)
        myButton.frame = CGRect.init(x: xAxis, y: yAxis, width: 100, height: 45)
        myButton.setImage(img, for: .normal)
        myButton.addTarget(self, action: Selector(("btnTouched:")), for:.touchUpInside)
        self.view.addSubview(myButton)
            buttons.append(myButton)
        } else {
            xAxis += 30
                let img = UIImage(named: "chemical-icon-png-6_25x25")
                let myButton = UIButton(type: UIButton.ButtonType.custom)
            
                myButton.frame = CGRect.init(x: xAxis, y: yAxis, width: 100, height: 45)
                myButton.setImage(img, for: .normal)
                myButton.addTarget(self, action: Selector(("btnTouched:")), for:.touchUpInside)
                self.view.addSubview(myButton)
            buttons.append(myButton)
            
        }
    
    }
}


