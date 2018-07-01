//
//  JSON.swift
//  challenge
//
//  Created by Denis Garifyanov on 28/06/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import Foundation
import Alamofire

class transportProtocol {
    var token: String
    
    init(_ token: String) {
        self.token = token
    }
    
    func loadFriends (){
        let path = "https://api.vk.com/method/friends.get?v=5.52&access_token=\(token)"
        guard let url = URL(string: path) else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                print(data)
                print("data Recieved")
            }
        }
        task.resume()
    }
    
    func loadMyGroups (){
        var urlConstructor = URLComponents()
        //print(#function)
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/groups.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "v", value: "5.52"),
            URLQueryItem(name: "access_token", value: token)
        ]
        guard let url = urlConstructor.url else {return}
        //print(url)
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("*************************")
                print(error)
                return
            }
            if let data = data {
                print(data)
                print("*************************")
            }

        }
        task.resume()
    }
    
    func loadFriendPhoto(){
        let path = "https://api.vk.com/method/photos.get"
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.52",
            "album_id": "wall"
        ]
        Alamofire.request(path, parameters: parameters).responseJSON { (response) in
            if let error = response.error{
                print (error)
            }
            if let value = response.value {
                print(value)
            }
        }
        
    }
    func loadAllGroups(){
        let path = "https://api.vk.com/method/groups.get"
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.58",
            "q": "",
            "count": 15
        ]
        Alamofire.request(path, parameters: parameters).responseJSON { (response) in
            if let error = response.error{
                print (error)
            }
            if let value = response.value {
                print(value)
            }
        }
    }
        func loadAllGroups(bySearching search: String){
            let path = "https://api.vk.com/method/groups.search"
            let parameters: Parameters = [
                "access_token": token,
                "v": "5.58",
                "count": 15,
                "q": search
            ]
            Alamofire.request(path, parameters: parameters).responseJSON { (response) in
                if let error = response.error{
                    print (error)
                }
                if let value = response.value {
                    print(value)
                }
            }
        
    }
    
}
