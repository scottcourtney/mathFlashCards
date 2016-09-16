//
//  ViewController.swift
//  mathFlashCards
//
//  Created by Scott Courtney on 9/13/16.
//  Copyright © 2016 Scott Courtney. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.logoutButton.isHidden = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Logout(_ sender: AnyObject) {
        try! FIRAuth.auth()?.signOut()
        UserDefaults.standard.setValue(nil, forKey: "uid")
        self.logoutButton.isHidden = true

    }

}

