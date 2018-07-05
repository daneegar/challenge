//
//  ModelFriends.swift
//  challenge
//
//  Created by Denis Garifyanov on 02/07/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class ModelUser: Object {
    var completeName: String {
        return "\(firstName) \(lastName)"
    }
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var photoUrl = ""
    @objc dynamic var userID = ""

    
    convenience init(json: JSON) {
        self.init()
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.photoUrl = json["photo_100"].stringValue
        self.userID = json["id"].stringValue
    }

}
