//
//  LoginController.swift
//  mathFlashCards
//
//  Created by Scott Courtney on 9/13/16.
//  Copyright © 2016 Scott Courtney. All rights reserved.
//

import Foundation
import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        if UserDefaults.standard.value(forKey: "uid") != nil && CURRENT_USER.authData != nil {
//            self.logoutButton.isHidden = false
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: AnyObject) {
//        let username = self.usernameTextField.text
//        let password = self.passwordTextField.text
//        
//        if username != "" && password != "" {
//            FIREBASE_REF.authUser(username, password: password, withCompletionBlock: {(error, authData) -> Void in
//                
//                if error == nil {
//                    UserDefaults.standard.setValue(authData, forKey: "uid")
//                    
//                    print("Logged In")
//                    
//                    self.logoutButton.isHidden = false
//                    
//                } else {
//                    print(error)
//                }
//        })
//    }
//        else {
//            let alert = UIAlertController(title: "Error", message: "Enter Username and Password", preferredStyle: .alert)
//            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alert.addAction(action)
//            self.present(alert, animated: true, completion: nil)
//            
//        }
    }
    @IBAction func logoutAction(_ sender: AnyObject) {
//        CURRENT_USER.unauth()
//        UserDefaults.standard.setValue(nil, forKey: "uid")
//        self.logoutButton.isHidden = true
    }
}











