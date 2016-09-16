//
//  LoginController.swift
//  mathFlashCards
//
//  Created by Scott Courtney on 9/13/16.
//  Copyright © 2016 Scott Courtney. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase
import LocalAuthentication

class LoginController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        let authenticationContext = LAContext()
        
        super.viewDidLoad()
        authenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "WooHoo It Works", reply: {[unowned self] (success, error) -> Void in
            if (success) {
                print("Touch ID is working")
                print(FIRUserInfo.self)
                self.navigateToVC()
            } else {
                print("Touch Id is broken")
                //do error
            }
            })
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if UserDefaults.standard.value(forKey: "uid") != nil && FIRAuth.auth()?.currentUser != nil {
            self.logoutButton.isHidden = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: AnyObject) {
        let username = self.usernameTextField.text
        let password = self.passwordTextField.text
        
        if username != "" && password != "" {
            FIRAuth.auth()?.signIn(withEmail: username!, password: password!, completion: {(user, error) -> Void in
                
                if error == nil {
                    UserDefaults.standard.setValue(user?.uid, forKey: "uid")
                    print("Logged In")
                    self.navigateToVC()
                    self.logoutButton.isHidden = false
                    
                } else {
                    print(error)
                }
        })
    }
        else {
            let alert = UIAlertController(title: "Error", message: "Enter Username and Password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func logoutAction(_ sender: AnyObject) {
        try! FIRAuth.auth()?.signOut()
        UserDefaults.standard.setValue(nil, forKey: "uid")
        self.logoutButton.isHidden = true
    }
    func navigateToVC() {
        if let loggedIn = self.storyboard?.instantiateViewController(withIdentifier: "MathPickerController") {
            self.present(loggedIn, animated: true, completion: nil)
                
            }
        }
    }












