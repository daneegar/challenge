//
//  JSON.swift
//  challenge
//
//  Created by Denis Garifyanov on 28/06/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class transportProtocol {
    var token: String
    
    init(_ token: String) {
        self.token = token
    }
    
    func loadFriends (completion:(([ModelUser]?, Error?)-> Void)?) {
        let path = "https://api.vk.com/method/friends.get?v=5.80&access_token=\(token)&fields=photo_100&name_case=nom"
        guard let url = URL(string: path) else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                if let json = try? JSON(data: data) {
                    let friends = json["response"]["items"].arrayValue.map { ModelUser(json: $0)}
                    DispatchQueue.main.async {
                        completion?(friends, nil)
                    }
                }
            }
        }
        task.resume()
    }
    
    func loadMyGroups (completion: (([ModelGroup]?, Error?) -> Void)?){
        var urlConstructor = URLComponents()

        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/groups.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "v", value: "5.52"),
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "extended", value: "1")
        ]
        guard let url = urlConstructor.url else {return}

        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("*************************")
                print(error)
                return
            }
            if let data = data {
                print("*************************")
                if let json = try? JSON(data: data) {
                    let groups = json["response"]["items"].arrayValue.map { ModelGroup(json: $0)}
                    DispatchQueue.main.async {
                        completion?(groups, nil)
                    }
                    
                }
            }

        }
        task.resume()
    }
    
    func loadFriendPhoto(byID ownerID: String, completion: (([ModelPhoto]?, Error?) -> Void)?){
        let path = "https://api.vk.com/method/photos.getAll"
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.52",
            "owner_id": ownerID
        ]
        Alamofire.request(path, parameters: parameters).responseJSON { (response) in
            
            if let error = response.error{
            }
            if let value = response.data {
                if let json = try? JSON(data: value) {
                    let photos = json["response"]["items"].arrayValue.map { ModelPhoto(json: $0)}
                    DispatchQueue.main.async {
                        completion?(photos, nil)
                    }

                }
            }
        }
        
    }
    func loadAllGroups(completion: (([ModelGroup]?, Error?)->Void)?){
        let path = "https://api.vk.com/method/groups.search"
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.58",
            "q": "Бизнес",
            "count": 100
        ]
        Alamofire.request(path, parameters: parameters).responseJSON { (response) in
            if let error = response.error{
                print (error)
            }
            if let value = response.data {
                if let json = try? JSON(data: value) {
                    //print (json)
                    let groups = json["response"]["items"].arrayValue.map { ModelGroup(json: $0)}
                    DispatchQueue.main.async {
                        completion?(groups, nil)
                    }
                    
                }
            }
        }
    }
    func loadAllGroups(bySearching search: String, completion:(([ModelGroup]?, Error?)->Void)?){
            let path = "https://api.vk.com/method/groups.search"
            let parameters: Parameters = [
                "access_token": token,
                "v": "5.58",
                "count": 100,
                "q": search
            ]
            Alamofire.request(path, parameters: parameters).responseJSON { (response) in
                if let error = response.error{
                    print (error)
                }
                if let value = response.data {
                    if let json = try? JSON(data: value) {
                        let groups = json["response"]["items"].arrayValue.map { ModelGroup(json: $0)}
                        DispatchQueue.main.async {
                            completion?(groups, nil)
                        }
                        
                    }
                }
        }
    }
    
    static func loadMembersOfGroup(forGroup group: ModelGroup, token: String){
        let path = "https://api.vk.com/method/groups.getMembers"
        let parameters: Parameters = [
            "access_token": token,
            "group_id": group.groupID!,
            "v": "5.8",
            "count": "1"
            
        ]
        Alamofire.request(path, parameters: parameters).responseJSON { (response) in
            if let error = response.error{
                print (error)
            }
            if let value = response.data {
                if let json = try? JSON(data: value) {
                    print(json)
                    let count = json["response"]["count"].stringValue
                    group.membersCount = count
                    
                }
            }
        }
    }
    
}
