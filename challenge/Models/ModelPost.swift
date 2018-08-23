//
//  ModelPost.swift
//  challenge
//
//  Created by Denis Garifyanov on 23/08/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import Foundation
import SwiftyJSON

class ModelPost: CustomStringConvertible {
    let id: Int
    let text: String
    var description: String {
        return "\(id)   \(text)"
    }
    
    init (json: JSON){
        self.id = Int(json["id"].stringValue)!
        self.text = json["text"].stringValue
    }
    
}
