//
//  FirstViewController.swift
//  ChemiLog
//
//  Created by HEDLUND, MAVERICK on 12/13/18.
//  Copyright © 2018 District196.org. All rights reserved.
//

import UIKit
var deleteRow = true
var chemicalList = [Chemical]()

class FirstViewController: UIViewController {
    
    //Bool that determines if delete button is visible
    var deleteButtonExist : Bool = false
    var persistentChemical = persistentData()
    
    //Main Array of all Chemicals
    func sortChems(){
        //chemicalList = chemicalList.sorted(by: {$0 < $1})
    }
    
    var toDeleteIndex = -1;

     @IBOutlet weak var collectionView: UICollectionView!
    
    //Persistent data
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        persistentChemical.restore(fileName: "test1")
        if persistentChemical.savedName.count > 0{
            for num in 0...persistentChemical.savedName.count - 1{
                let persistentChemicalNew = Chemical(quantity: persistentChemical.savedQuantity[num], name: persistentChemical.savedName[num], catalogNumber: persistentChemical.savedCatalogNumber[num], lastRefill: persistentChemical.savedLastRefill[num], nextRefill: persistentChemical.savedNextRefill[num], usedLabs: persistentChemical.savedUsedLabs[num], icon: persistentChemical.savedIcon[num], amount: persistentChemical.savedAmount[num])
                chemicalList.append(persistentChemicalNew)
            }
        } //else {
            //chemicalList.append(Chemical(quantity: 1, name: "placeHolder"
              //  , catalogNumber: "b0238", lastRefill: "then", nextRefill: "then", usedLabs: //"then", icon: "then", amount: 1))
        //}
        
        
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(alertShown), name: Notification.Name("alert"), object: nil)
    }
    @objc func alertShown() {
        let alert = UIAlertController(title: "Are you sure you want to delete this Chemical?", message: "You will not be able to recover it if yes.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive, handler: { (action) in alert.dismiss(animated: true, completion: nil)
            deleteRow = true
            print(self.toDeleteIndex)
            self.deleteData(indx: self.toDeleteIndex,cell: self.collectionView.visibleCells[self.toDeleteIndex])
            self.collectionView.reloadData()
        }) )
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
            
            
        }))

        self.present(alert, animated: true)
    }
        
    
    //Segue that activates when the plus button is tapped
    @IBAction func toAddChem(_ sender: Any) {
        performSegue(withIdentifier: "toManualAdd", sender: self)
    }
    
    //Toggles editing mode for deleting chemicals
    @IBAction func toggleEdit(_ sender: Any) {
        if deleteButtonExist {
            deleteButtonExist = false
        }
        else{
            deleteButtonExist = true
        }
        collectionView.reloadData()
    }
    
    //Brings back to first view when backbutton is tapped
    @IBAction func toFirstView(unwindSegue: UIStoryboardSegue){
    }
    
    //Segue that submits a chemical along with all entered data
    @IBAction func toSubmitNewChem(_ sender: UIStoryboardSegue)
    {

            if let senderVC = sender.source as? ManualAddController{
                senderVC.newChem.name = senderVC.nameIn.text ?? " "
                senderVC.newChem.quantity = Int(senderVC.quantityIn.text ?? "0") ?? 0
                senderVC.newChem.catalogNumber = senderVC.catalogIn.text ?? ""
                senderVC.newChem.lastRefill = senderVC.lastRefillIn.text ?? " "
                senderVC.newChem.nextRefill = senderVC.nextUseIn.text ?? " "
                senderVC.newChem.catalogLink = " "
                senderVC.newChem.icon = "Flask"
                senderVC.newChem.usedLabs = senderVC.labUsedIn.text ?? ""
                senderVC.newChem.amount = Int(senderVC.amountIn.text ?? "") ?? 0
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
    //NOT WORKING Function that allows you to resumbmit the name
    @IBAction func toEditExistingChem(_ sender: UIStoryboardSegue){
        collectionView.reloadData()
            
        }
}


//Required by parent class
extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chemicalList.count
    }
    
    //Controls what is displayed in each cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.chemicalName.text = chemicalList[indexPath.row].name
        cell.index = indexPath
        cell.parentView = self
        cell.tag = indexPath.row
        cell.delegate = self
        if deleteButtonExist {
            cell.deleteButton.isHidden = false
        }
        else{
            cell.deleteButton.isHidden = true
        }
        return cell
    }
    
   
    //Function that prepares data for when a chemical is clicked on
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? ChemicalDetailsController{
            if let cell = sender as? CollectionViewCell {
                print("Loading Cell \(cell.tag)")
                dvc.id = cell.tag
                dvc.detailName2 = chemicalList[cell.tag].name
                dvc.detailQuantity2 = chemicalList[cell.tag].quantity
                dvc.detailCatalog2 = chemicalList[cell.tag].catalogNumber
                dvc.detailLastRefill2 = chemicalList[cell.tag].lastRefill
                dvc.detailNextRefill2 = chemicalList[cell.tag].nextRefill
                dvc.detailLabs2 = chemicalList[cell.tag].usedLabs
                dvc.detailAmount2 = chemicalList[cell.tag].amount
                dvc.detailCatalogLink2 = URL(string: chemicalList[cell.tag].catalogLink)
            }
        }
    }
}

extension FirstViewController: dataCollectionProtocol{
    
    //Delete Function
    func deleteData(indx: Int, cell: UICollectionViewCell) {
        if deleteRow == true{
            chemicalList.remove(at: indx)
            persistentChemical.savedName.remove(at: indx)
            persistentChemical.savedQuantity.remove(at: indx)
            persistentChemical.savedCatalogNumber.remove(at: indx)
            persistentChemical.savedLastRefill.remove(at: indx)
            persistentChemical.savedNextRefill.remove(at: indx)
            persistentChemical.savedCatalogLink.remove(at: indx)
            persistentChemical.savedIcon.remove(at: indx)
            persistentChemical.savedUsedLabs.remove(at: indx)
            persistentChemical.savedAmount.remove(at: indx)
            persistentChemical.archive(fileName: "test1")
            collectionView.deleteItems(at: [collectionView.indexPath(for: cell)!])
            print("Deleted cell at \(indx)")
            collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
        }
    }
    
    
}

