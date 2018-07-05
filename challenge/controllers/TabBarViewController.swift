//
//  LoginStatusViewController.swift
//  challenge
//
//  Created by Denis Garifyanov on 16/06/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import UIKit



class TabBarViewController: UITabBarController {
    var token = ""
    
//    @IBOutlet weak var buttonStatus: UIButton!
    
    
override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarViesCollections = viewControllers
    
            if let childViews = tabBarViesCollections?.first as? UINavigationController{
            do {
                let catchedTable = childViews.viewControllers[0] as? TVCintrollerFriends
                catchedTable?.token = self.token
            } catch {
                print(error)
            }
            if let childViews = tabBarViesCollections?[1] as? UINavigationController{
                do {
                    let catchedTable = try childViews.viewControllers[0] as! TVControllerMyGroups
                    catchedTable.token = self.token
                } catch {
                    print(error)
                }
            }
    }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonStatusPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function)
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
