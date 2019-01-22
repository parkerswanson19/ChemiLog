//
//  FirstViewController.swift
//  ChemiLog
//
//  Created by HEDLUND, MAVERICK on 12/13/18.
//  Copyright © 2018 District196.org. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var chemicalList2 = [
        Chemical(quantity: 300, name: "Oxygen", catalogNumber: 45, lastRefill: 517, nextRefill: 617, usedLabs: "PennyLab", icon: "Flask", amount: 100),
        Chemical(quantity: 300, name: "Neon", catalogNumber: 45, lastRefill: 517, nextRefill: 617, usedLabs: "PennyLab", icon: "Flask", amount: 100)
    ]

     @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func toAddChem(_ sender: Any) {
        performSegue(withIdentifier: "toManualAdd", sender: self)
    }
    @IBAction func toFirstView(unwindSegue: UIStoryboardSegue){}
    

    
}

extension FirstViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chemicalList2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.chemicalName.text = chemicalList2[indexPath.row].name
        return cell
    }
    
    
}
