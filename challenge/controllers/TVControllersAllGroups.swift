//
//  TVControllersAllGroups.swift
//  challenge
//
//  Created by Denis Garifyanov on 25/06/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import UIKit
protocol AddGroupsProtocolDelegate {
    func AddGroup(nameOfGroup:String)
}

class TVControllersAllGroups: UITableViewController, UISearchBarDelegate {
    var token = ""
    var groups: [String] = ["c++", "Swift", "Python", "Java", "JavaScrip"]
    //let delegate: AddGroupsProtocolDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let JSONAction = transportProtocol(token)
        JSONAction.loadAllGroups()
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroup", for: indexPath) as! UITVCellOfAllGroup
        cell.nameOfGroup.text = groups[indexPath.row]
        return cell
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(searchBar.text!)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        let JSONAction = transportProtocol(token)
        JSONAction.loadAllGroups(bySearching: searchText)
    }
}

