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
    
    
    var labList = ["Penny Lab", "Lab lab", "Corey Lab"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}
extension ThirdViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "labCell", for: indexPath) as! TableViewCell
    tableCell.labName.text = labList[indexPath.row]
    return tableCell
    }
}
