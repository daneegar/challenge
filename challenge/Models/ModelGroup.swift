//
//  ModelGroups.swift
//  challenge
//
//  Created by Denis Garifyanov on 02/07/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import Foundation
import SwiftyJSON

class ModelGroup {
    var name = ""
    var membersCount: String = "0"
    var photoUrl: String?
    var groupID: String?
    //TODO: - declare an init
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.photoUrl = json["photo_100"].stringValue
        self.groupID = json["id"].stringValue
    }
    
}
