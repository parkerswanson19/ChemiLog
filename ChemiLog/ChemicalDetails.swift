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
    var detailQuantity2 = 100
    var detailCatalog2 = ""
    var detailLastRefill2 = ""
    var detailNextRefill2 = ""
    var detailLabs2 = " "
    var detailAmount2 = 1
    var chemList = [Chemical]()
    var persistentChemical2 = persistentData()
   
    
    @IBAction func flinnCatalog(_ sender: Any) {
        print(persistentChemical2.savedCatalogLink[0])
        let linky = persistentChemical2.savedCatalogLink[0]
        UIApplication.shared.open(URL(string: linky)!, options: [:], completionHandler: nil )
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
    }
    
}
