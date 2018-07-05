//
//  FriendsPhoto.swift
//  challenge
//
//  Created by Denis Garifyanov on 02/07/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift


class ModelPhoto: Object {
    @objc dynamic var url = ""
    @objc dynamic var likes = 0
    
    convenience init(json: JSON) {
        self.init()
        self.url = json["photo_130"].stringValue
    }
}
