//
//  CVControllerPhotos.swift
//  challenge
//
//  Created by Denis Garifyanov on 25/06/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "Cell"

class CVControllerPhotos: UICollectionViewController {
    var name: String? = nil
    var token: String? = ""
    var userID = ""
    var photos: [ModelPhoto] = []
    var realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        loadDataFromAPI()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    //MARK: - data load methods
    func loadDataFromAPI () {
        if let unwrapedToken = token {
            let JSONAction = transportProtocol(unwrapedToken)
            JSONAction.loadFriendPhoto(byID: userID) { (cathedPhotos, error) in
                if let someError = error {
                    print(someError)
                    //TODO - the error handler
                }
                if let photos = cathedPhotos {
                    self.photos = photos
                    self.collectionView?.reloadData()
                }
            }
        }
    }
    func loadDataFromLocalStorage(){
        let catchedGroups = Array(realm.objects(ModelPhoto.self))
        photos = catchedGroups
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! UICCPhoto
        cell.setByListOfPhoto(photos[indexPath.row])
        
        // Configure the cell
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
