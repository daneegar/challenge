//
//  ViewController.swift
//  challenge
//
//  Created by Denis Garifyanov on 15/06/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var ScrolView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var PasswordInput: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyBoardGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        ScrolView?.addGestureRecognizer(hideKeyBoardGesture)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboadWasShown), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.​​keyboardWillBeHidden), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        
    }
    
    @objc func keyboadWasShown (notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentLnSets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
        
        self.ScrolView?.contentInset = contentLnSets
        self.ScrolView?.scrollIndicatorInsets = contentLnSets
    }
   
    @objc func ​​keyboardWillBeHidden(​​notification: Notification){
        let contenLnSets = UIEdgeInsets.zero
        self.ScrolView?.contentInset = contenLnSets
        self.ScrolView?.scrollIndicatorInsets = contenLnSets
    }
    
    @objc func hideKeyboard() {
        self.ScrolView?.endEditing(true)
    }
    
}
