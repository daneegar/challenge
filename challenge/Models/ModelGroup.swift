//
//  ModelGroups.swift
//  challenge
//
//  Created by Denis Garifyanov on 02/07/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class ModelGroup: Object {
    @objc dynamic var name = ""
    @objc dynamic var membersCount: String = "0"
    @objc dynamic var photoUrl: String?
    @objc dynamic var groupID: String?
    //TODO: - declare an init
    convenience init(json: JSON) {
        self.init()
        self.name = json["name"].stringValue
        self.photoUrl = json["photo_100"].stringValue
        self.groupID = json["id"].stringValue
    }
    
    static func addID(from json: JSON)-> String {
        return json["members_count"].stringValue
    }
}
