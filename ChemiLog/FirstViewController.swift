//
//  FirstViewController.swift
//  ChemiLog
//
//  Created by HEDLUND, MAVERICK on 12/13/18.
//  Copyright © 2018 District196.org. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {
    
    
    
    var persistentChemical = persistentData()
    var chemicalList = [Chemical]()

     @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        persistentChemical.restore(fileName: "test1")
        for num in 0...persistentChemical.savedName.count - 1{
            let persistentChemicalNew = Chemical(quantity: persistentChemical.savedQuantity[num], name: persistentChemical.savedName[num], catalogNumber: persistentChemical.savedCatalogNumber[num], lastRefill: persistentChemical.savedLastRefill[num], nextRefill: persistentChemical.savedNextRefill[num], usedLabs: persistentChemical.savedUsedLabs[num], icon: persistentChemical.savedIcon[num], amount: persistentChemical.savedAmount[num])
                chemicalList.append(persistentChemicalNew)
        }
        
        
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
            persistentChemical.savedName.append(senderVC.newChem.name)
            persistentChemical.savedQuantity.append(senderVC.newChem.quantity)
            persistentChemical.savedCatalogNumber.append(senderVC.newChem.catalogNumber)
            persistentChemical.savedLastRefill.append(senderVC.newChem.lastRefill)
            persistentChemical.savedNextRefill.append(senderVC.newChem.nextRefill)
            persistentChemical.savedCatalogLink.append(senderVC.newChem.catalogLink)
            persistentChemical.savedIcon.append(senderVC.newChem.icon)
            persistentChemical.savedUsedLabs.append(senderVC.newChem.usedLabs)
            persistentChemical.savedAmount.append(senderVC.newChem.amount)
            persistentChemical.archive(fileName: "test1")
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
        cell.delegate = self
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
extension FirstViewController: CellDelegate{
    func delete(cell: CollectionViewCell) {
        if let indexPath = collectionView?.indexPath(for: cell){
            chemicalList.remove(at: indexPath.row)
            collectionView?.deleteItems(at: [indexPath])
        }
        
    }
    
}

