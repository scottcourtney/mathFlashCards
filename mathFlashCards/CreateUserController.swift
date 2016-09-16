//
//  CreateUserController.swift
//  mathFlashCards
//
//  Created by Scott Courtney on 9/14/16.
//  Copyright © 2016 Scott Courtney. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class CreateUserController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    @IBAction func createAccountAction(_ sender: AnyObject) {
        let username = self.usernameTextField.text
        let password = self.passwordTextField.text
        
        if username != "" && password != "" {
            
            FIRAuth.auth()!.createUser(withEmail: username!, password: password!) { (user, error) -> Void in
                if error == nil {
                    FIRAuth.auth()?.signIn(withEmail: username!, password: password!) { (user, error) -> Void in
                        if error == nil {
                            UserDefaults.standard.setValue(user?.uid, forKey: "uid")
                            print("Account Created")
                            self.dismiss(animated: true, completion: nil)
                        } else {
                            print(error)
                        }
                }
                        } else {
                            print(error)
                }
            }
        } else {
            let alert = UIAlertController(title: "ERROR", message: "Enter Username and Password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func cancelAccountAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
