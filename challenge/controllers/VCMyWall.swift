//
//  VCMyWall.swift
//  challenge
//
//  Created by Denis Garifyanov on 23/08/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import UIKit

class VCMyWall: UIViewController {
    
    @IBOutlet weak var PostsCounter: UILabel!
    var postCounter = "Считаю..."
    var token: String? = ""
    var listOfPosts: [ModelPost] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let token = self.token else {return}
        let JSONAction = transportProtocol(token)
        JSONAction.loadPosts(completion: { (catchedPosts, error, count) in
            if let error = error {
                print(error)
            }
            if let somePostsThere = catchedPosts {
                self.listOfPosts = somePostsThere
                for eachPost in self.listOfPosts {
                    print(eachPost)
                }
                self.PostsCounter.text = String(count!)
            }
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
