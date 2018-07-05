//
//  TVControllerGroups.swift
//  challenge
//
//  Created by Denis Garifyanov on 25/06/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import UIKit

class TVControllerMyGroups: UITableViewController {
    //var listOfgroups: [String] = ["Denis", "Vasilivar", "Marina", "Alyona", "Tatyana"]
    var token: String = ""
    var listOfMyGroups: [ModelGroup] = []
    
    @IBAction func addGroup (_ segue: UIStoryboardSegue){
//        if segue.identifier == "addGroup"{
//            let segueTable = segue.source as! TVControllersAllGroups
//            let selectedCell = segueTable.tableView.indexPathForSelectedRow
//            let selectedGroup = segueTable.groups[(selectedCell?.row)!]
//            if  !listOfgroups.contains(selectedGroup){
//                listOfgroups.append(selectedGroup)
//                self.tableView.reloadData()
//            }
//        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let VCTable = segue.destination as? TVControllersAllGroups{
            VCTable.token = token
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let JSONAction = transportProtocol(token)
        JSONAction.loadMyGroups { (catchedGroups, error) in
            if let error = error {
                print(error)
            }
            if let listOfgroups = catchedGroups {
                self.listOfMyGroups = listOfgroups
                self.tableView?.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfMyGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellOfMyGroup", for: indexPath) as! UITVCellOfMyGroup
//        cell.nameOfGroup.text = listOfMyGroups[indexPath.row].name
        let group = listOfMyGroups[indexPath.row]
        cell.setupWithData(group)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

