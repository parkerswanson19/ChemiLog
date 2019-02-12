//
//  CollectionViewCell.swift
//  ChemiLog
//
//  Created by HEDLUND, MAVERICK on 1/9/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation
import UIKit
protocol CellDelegate: class{
    func delete(cell: CollectionViewCell)
}
class CollectionViewCell: UICollectionViewCell{
    weak var delegate: CellDelegate?
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var deleteButtonBackgroundView: UIVisualEffectView!
    
    @IBOutlet weak var chemicalName: UILabel!
    
    @IBAction func deleteChemical(_ sender: Any) {
        delegate?.delete(cell: self)
    }
    
}
