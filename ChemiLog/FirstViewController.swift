//
//  FirstViewController.swift
//  ChemiLog
//
//  Created by HEDLUND, MAVERICK on 12/13/18.
//  Copyright © 2018 District196.org. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController  {
    var myIndex = 0
    var chemicalList = [
        Chemical(quantity: 300, name: "Oxygen", catalogNumber: 45, lastRefill: "517", nextRefill: "617", usedLabs: "PennyLab", icon: "Flask", amount: 100),
        Chemical(quantity: 300, name: "Neon", catalogNumber: 45, lastRefill: "517", nextRefill: "617", usedLabs: "PennyLab", icon: "Flask", amount: 100)
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
    
    @IBAction func toSubmitNewChem(_ sender: UIStoryboardSegue)
    {
        if let senderVC = sender.source as? ManualAddController{
            senderVC.newChem.name = senderVC.nameIn.text ?? " "
            senderVC.newChem.quantity = Int(senderVC.quantityIn.text ?? "0") ?? 0
            senderVC.newChem.catalogNumber = Int(senderVC.catalogIn.text ?? "0") ?? 0
            senderVC.newChem.lastRefill = senderVC.lastRefillIn.text ?? " "
            senderVC.newChem.nextRefill = senderVC.nextUseIn.text ?? " "
            senderVC.newChem.catalogLink = " "
            senderVC.newChem.icon = "Flask"
            senderVC.newChem.usedLabs = " "
            senderVC.newChem.amount = 0
            chemicalList.append(senderVC.newChem)
        }
        collectionView.reloadData()
    }
    
}

extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chemicalList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.chemicalName.text = chemicalList[indexPath.row].name
        cell.tag = indexPath.row
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? ChemicalDetailsController{
            if let cell = sender as? CollectionViewCell {
                dvc.detailName2 = chemicalList[cell.tag].name
                dvc.detailQuantity2 = chemicalList[cell.tag].quantity
                dvc.detailCatalog2 = chemicalList[cell.tag].catalogNumber
                dvc.detailLastRefill2 = chemicalList[cell.tag].lastRefill
                dvc.detailNextRefill2 = chemicalList[cell.tag].nextRefill
                dvc.detailLabs2 = chemicalList[cell.tag].usedLabs
                dvc.detailAmount2 = chemicalList[cell.tag].amount
            }
        }
    }
}


