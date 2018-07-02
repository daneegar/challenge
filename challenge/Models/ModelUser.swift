//
//  ModelFriends.swift
//  challenge
//
//  Created by Denis Garifyanov on 02/07/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import Foundation
import SwiftyJSON

class ModelUser{
    var completeName: String {
        return "\(firstName) \(lastName)"
    }
    var firstName = ""
    var lastName = ""
    var photoUrl = ""
    var userID = ""

    
    init(json: JSON) {
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.photoUrl = json["photo_100"].stringValue
        self.userID = json["id"].stringValue
    }

}
