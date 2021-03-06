//
//  ThirdViewController.swift
//  ChemiLog
//
//  Created by HEDLUND, MAVERICK on 12/14/18.
//  Copyright © 2018 District196.org. All rights reserved.
//

import UIKit

var labList = [Lab]()
class ThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var persistentLab = persistentDataLab()
    var currDate = Date.init(timeIntervalSinceNow: 0)
    var place = 0
    var place2 = 0
    var persistentChemical4 = persistentData()
    var chemList = [Chemical]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        persistentLab.restore(fileName: "testLab")
        if persistentLab.persistentClassName.count > 0{
            for num in 0...persistentLab.persistentClassName.count - 1{
                let persistentLabNew = Lab(labDate: persistentLab.persistentLabDate[num], labName: persistentLab.persistentLabName[num], className: persistentLab.persistentClassName[num], chemicalUsed: persistentLab.persistentChemicalUsed[num], quantity: persistentLab.persistentQuantity[num], labType: persistentLab.persistentLabType[num], notify: persistentLab.persistentNotify[num])
                labList.append(persistentLabNew)
            }
        }
        persistentChemical4.restore(fileName: "test1")
        if persistentChemical4.savedName.count > 0{
            for num in 0...persistentChemical4.savedName.count - 1{
                let persistentChemicalNew = Chemical(quantity: persistentChemical4.savedQuantity[num], name: persistentChemical4.savedName[num], catalogNumber: persistentChemical4.savedCatalogNumber[num], lastRefill: persistentChemical4.savedLastRefill[num], nextRefill: persistentChemical4.savedNextRefill[num], usedLabs: persistentChemical4.savedUsedLabs[num], icon: persistentChemical4.savedIcon[num], amount: persistentChemical4.savedAmount[num])
                chemList.append(persistentChemicalNew)
            }
        }
        
        /*for lab in labList{
            if lab.labDate < currDate{


                self.persistentLab.persistentLabName.remove(at: place)
                self.persistentLab.persistentClassName.remove(at: place)
                self.persistentLab.persistentQuantity.remove(at: place)
                self.persistentLab.persistentNotify.remove(at: place)
                self.persistentLab.persistentLabType.remove(at: place)
                self.persistentLab.persistentChemicalUsed.remove(at: place)
                self.persistentLab.persistentLabDate.remove(at: place)
               
                labList.remove(at: place)
                
            }
            place = place + 1
        }
         place = 0
        self.persistentLab.archive(fileName: "testLab")*/
 

        // Do any additional setup after loading the view, typically from a null.
    }
    @IBAction func toThirdView(unwindSegue: UIStoryboardSegue){}
    @IBAction func toEditExistingLab(_ sender: UIStoryboardSegue)
    {
        //tableView.reloadData()
    }
    
    @IBAction func toSubmitNewLab(_ sender: UIStoryboardSegue)
    {
     if let senderVC = sender.source as? AddLabController{
        senderVC.newLab.labName = senderVC.nameIn.text ?? ""
        senderVC.dateIn.calendar = Calendar.current
        senderVC.newLab.labDate = senderVC.dateIn.date
        senderVC.newLab.className = senderVC.classIn.text ?? ""
        senderVC.newLab.chemicalUsed = pickerData[senderVC.chemicalIn.selectedRow(inComponent: 0)]
        senderVC.newLab.quantity = Int(senderVC.amountIn.text ?? " ") ?? 0
        senderVC.newLab.notify = senderVC.notifyIn.isOn
        labList.append(senderVC.newLab)
        persistentLab.persistentLabName.append(senderVC.newLab.labName)
        persistentLab.persistentClassName.append(senderVC.newLab.className)
        persistentLab.persistentQuantity.append(senderVC.newLab.quantity)
        persistentLab.persistentNotify.append(senderVC.newLab.notify)
        persistentLab.persistentLabType.append(true)
        persistentLab.persistentChemicalUsed.append("that one")
        persistentLab.persistentLabDate.append(senderVC.newLab.labDate)
        persistentLab.archive(fileName: "testLab")

        }
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in labList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            self.persistentLab.persistentLabName.remove(at: indexPath.row)
            self.persistentLab.persistentClassName.remove(at: indexPath.row)
            self.persistentLab.persistentQuantity.remove(at: indexPath.row)
            self.persistentLab.persistentNotify.remove(at: indexPath.row)
            self.persistentLab.persistentLabType.remove(at: indexPath.row)
            self.persistentLab.persistentChemicalUsed.remove(at: indexPath.row)
            self.persistentLab.persistentLabDate.remove(at: indexPath.row)
            self.persistentLab.archive(fileName: "testLab")
            tableView.reloadData()

        }
        return [delete]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "labCell", for: indexPath) as! TableViewCell
    tableCell.labName.text = labList[indexPath.row].labName
        let formatter = DateFormatter()
        formatter.dateFormat = "MM"
        let input = labList[indexPath.row].labDate
        let month = formatter.string(from: input)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: input)
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: input)
        tableCell.labDate.text = "\(month)/\(day)/\(year)"
        tableCell.tag = indexPath.row
        return tableCell
    }

    @IBAction func toEditLab(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? LabDetailsController{
            if let tableCell = sender as? TableViewCell {
                dvc.id = tableCell.tag
                dvc.detailNameLab2 = labList[tableCell.tag].labName
                dvc.detailLabDate2 = labList[tableCell.tag].labDate
                dvc.detailClassLab2 = labList[tableCell.tag].className
                dvc.detailChemicalLab2 = labList[tableCell.tag].chemicalUsed
                dvc.detailAmountUsedLab2 = labList[tableCell.tag].quantity
                dvc.detailNotifyLab2 = labList[tableCell.tag].notify
                print(dvc.detailChemicalLab2)
            }
        }
    }
}

