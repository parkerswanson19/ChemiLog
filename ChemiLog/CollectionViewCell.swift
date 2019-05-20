//
//  CollectionViewCell.swift
//  ChemiLog
//
//  Created by HEDLUND, MAVERICK on 1/9/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation
import UIKit
var classDeleteAttempt = false

protocol dataCollectionProtocol: class{
    func deleteData(indx: Int, cell: UICollectionViewCell)
}
class CollectionViewCell: UICollectionViewCell{
    var delegate: dataCollectionProtocol?
    var index: IndexPath?
    var parentView: FirstViewController?
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var deleteButtonBackgroundView: UIVisualEffectView!
    
    @IBOutlet weak var chemicalName: UILabel!
    
    @IBOutlet weak var shownIcon: UIImageView!
    @IBAction func deleteChemical(_ sender: Any){
        classDeleteAttempt = true
        NotificationCenter.default.post(name: Notification.Name("alert"), object: nil)
        print(index?.row)
        parentView?.toDeleteIndex = index?.row ?? -1
    }
    
}

