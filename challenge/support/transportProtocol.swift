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
    var token: String?
    
    init(_ token: String) {
        self.token = token
    }
    
    func loadGroups (){
        let path = ""
        guard let url = URL(string: path) else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                print(data)
            }
        }
        task.resume()
    }
    
    func loadFriends (){
        var urlConstructor = URLComponents()
        print(#function)
        urlConstructor.scheme = "http"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/friends.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: "5.52")
        ]
        guard let url = urlConstructor.url else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
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
    }
    
    func loadFriendPhoto(){
//        let path = "http://samples.openweathermap.org/data/2.5/forecast"
//        let parameters: Parameters = [
//            "q": cityName,
//            "appid": apiKey
//        ]
//
//        Alamofire.request(path, parameters: parameters).responseJSON { response in
//            if let error = response.error {
//                print(error)
//                return
//            }
//            if let value = response.value {
//                print(value)
//            }
//        }
       
//        let path = "http://api.vk.com/method/friends.get"
//        let parameters: Parameters = [
//            "access_token": token,
//            "v": "5.52"
//        ]
//        Alamofire.request(path).responseJSON { (response) in
//            if let error = response.error{
//                print (error)
//            }
//            if let value = response.value {
//                print(response)
//            }
//        }
        
    }
    
}
