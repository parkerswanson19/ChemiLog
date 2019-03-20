//
//  ThirdViewController.swift
//  ChemiLog
//
//  Created by HEDLUND, MAVERICK on 12/14/18.
//  Copyright © 2018 District196.org. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var labList = [Lab]()
    var persistentLab = persistentDataLab()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        persistentLab.restore(fileName: "testLab")
        if persistentLab.persistentClassName.count > 0{
            for num in 0...persistentLab.persistentClassName.count - 1{
                let persistentLabNew = Lab(labDate: persistentLab.persistentLabDate[num], labName: persistentLab.persistentLabName[num], className: persistentLab.persistentClassName[num], chemicalUsed: persistentLab.persistentChemicalUsed[num], quantity: persistentLab.persistentQuantity[num], labType: persistentLab.persistentLabType[num], notify: persistentLab.persistentNotify[num])
                labList.append(persistentLabNew)
                
            }
        }
        
        // Do any additional setup after loading the view, typically from a null.
    }
    @IBAction func toThirdView(unwindSegue: UIStoryboardSegue){}
    
    @IBAction func toSubmitNewLab(_ sender: UIStoryboardSegue)
    {
        if let senderVC = sender.source as? AddLabController{
            senderVC.newLab.labName = senderVC.nameIn.text ?? ""
            //senderVC.newLab.labDate = senderVC.dateIn
            senderVC.newLab.className = senderVC.classIn.text ?? ""
            //senderVC.newLab.chemicalUsed = senderVC.chemicalIn
            senderVC.newLab.quantity = Int(senderVC.amountIn.text ?? " ") ?? 0
            senderVC.newLab.notify = senderVC.notifyIn.isOn
            labList.append(senderVC.newLab)
            persistentLab.persistentLabName.append(senderVC.newLab.labName)
            persistentLab.persistentClassName.append(senderVC.newLab.className)
            persistentLab.persistentQuantity.append(senderVC.newLab.quantity)
            persistentLab.persistentNotify.append(senderVC.newLab.notify)
            persistentLab.persistentLabType.append(true)
            persistentLab.persistentChemicalUsed.append("that one")
            persistentLab.persistentLabDate.append("then")
            persistentLab.archive(fileName: "testLab")
        }
        tableView.reloadData()
    }
}
extension ThirdViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "labCell", for: indexPath) as! TableViewCell
        tableCell.labName.text = labList[indexPath.row].labName
        tableCell.tag = indexPath.row
        return tableCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? LabDetailsController{
            if let tableCell = sender as? TableViewCell {
                dvc.detailNameLab2 = labList[tableCell.tag].labName
                //dvc.detailLabDate2 = labList[tableCell.tag].labDate
                dvc.detailClassLab2 = labList[tableCell.tag].className
                dvc.detailChemicalLab2 = labList[tableCell.tag].chemicalUsed
                dvc.detailAmountUsedLab2 = labList[tableCell.tag].quantity
                dvc.detailNotifyLab2 = labList[tableCell.tag].notify
            }
        }
    }
}

