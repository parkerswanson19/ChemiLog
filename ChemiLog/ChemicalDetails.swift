//
//  ChemicalDetails.swift
//  ChemiLog
//
//  Created by Maverick on 1/23/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class ChemicalDetailsController: UIViewController{
    
    
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailQuantity: UITextField!
    @IBOutlet weak var detailCatalog: UITextField!
    @IBOutlet weak var detailLastRefill: UITextField!
    @IBOutlet weak var detailNextRefill: UITextField!
    @IBOutlet weak var detailLabs: UITextField!
    @IBOutlet weak var detailAmount: UITextField!
    
    var detailName2 = ""
    var detailQuantity2 = 1
    var detailCatalog2 = 1
    var detailLastRefill2 = ""
    var detailNextRefill2 = ""
    var detailLabs2 = " "
    var detailAmount2 = 1
    
    @IBAction func flinnCatalog(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.flinnsci.com/1-bromobutane-100-ml/b0238/")! as URL, options: [:], completionHandler: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(detailName2)
        detailName.text! = detailName2
        detailQuantity.text! = String(detailQuantity2)
        detailCatalog.text! = String(detailCatalog2)
        detailLastRefill.text! = detailLastRefill2
        detailNextRefill.text! = detailNextRefill2
        detailLabs.text! = detailLabs2
        detailAmount.text! = String(detailAmount2)
    }
    
}
