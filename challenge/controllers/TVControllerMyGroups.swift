//
//  TVControllerGroups.swift
//  challenge
//
//  Created by Denis Garifyanov on 25/06/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import UIKit

class TVControllerMyGroups: UITableViewController {
    var listOfgroups: [String] = ["Denis", "Vasilivar", "Marina", "Alyona", "Tatyana"]
    var token: String = ""
    
    @IBAction func addGroup (_ segue: UIStoryboardSegue){
        if segue.identifier == "addGroup"{
            let segueTable = segue.source as! TVControllersAllGroups
            let selectedCell = segueTable.tableView.indexPathForSelectedRow
            let selectedGroup = segueTable.groups[(selectedCell?.row)!]
            if  !listOfgroups.contains(selectedGroup){
                listOfgroups.append(selectedGroup)
                self.tableView.reloadData()
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let VCTable = segue.destination as? TVControllersAllGroups{
            VCTable.token = self.token
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let JSONAction = transportProtocol(token)
        JSONAction.loadMyGroups()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfgroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellOfMyGroup", for: indexPath) as! UITVCellOfMyGroup
        cell.nameOfGroup.text = listOfgroups[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}
