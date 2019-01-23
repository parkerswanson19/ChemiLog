//
//  ManualAdd.swift
//  ChemiLog
//
//  Created by Maverick on 1/16/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation
import UIKit

class ManualAddController: UIViewController {
    
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var name2: UITextField!
    @IBOutlet weak var catalog2: UITextField!
    @IBOutlet weak var quantity2: UITextField!
    @IBOutlet weak var lastRefill2: UITextField!
    @IBOutlet weak var nextUse2: UITextField!
    
    var added: Chemical!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
        
    
}
