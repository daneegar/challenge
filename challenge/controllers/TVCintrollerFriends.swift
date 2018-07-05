//
//  TVCintrollerFriends.swift
//  challenge
//
//  Created by Denis Garifyanov on 25/06/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import UIKit

class TVCintrollerFriends: UITableViewController {
    var token: String = ""
 
    
    var friends: [ModelUser] = []
    
    var selectedItemName: String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        let responser = transportProtocol(token)
        responser.loadFriends { (listOfFriends, error) in
            if let anError = error{
                print(anError)
                //TODO:- handle error
            }
            if let catchedFriends = listOfFriends {
                self.friends = catchedFriends
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as! UITVCellFriend
        
        let cathcedFriend = friends[indexPath.row]
        
        cell.setCell(byUser: cathcedFriend)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotosColletcion"{
            
            let destinatinoVC = segue.destination as! CVControllerPhotos
            destinatinoVC.name = friends[(tableView.indexPathForSelectedRow?.row)!].completeName
            destinatinoVC.token = self.token
            destinatinoVC.userID = friends[(tableView.indexPathForSelectedRow?.row)!].userID
        }
    }
    
    @IBAction func addFriend(_ sender: Any) {
//        var alertTextField = UITextField()
//        
//        let alertForNameanItem = UIAlertController(title: "Add Friend", message: "Name the friend", preferredStyle: .alert)
//        
//        let alertButtonPressed = UIAlertAction(title: "Add", style: .default) { (Alert) in
//            if alertTextField.text != "" {
//                self.friends.append(alertTextField.text!)
//            }
//            self.tableView.reloadData()
//        }
//        alertForNameanItem.addAction(alertButtonPressed)
//        
//        alertForNameanItem.addTextField { (AlertTextInput) in
//            AlertTextInput.placeholder = "Here..."
//            alertTextField = AlertTextInput
//        }
//        present(alertForNameanItem, animated: true)

    }
    
    
    
}
