//
//  BaseService.swift
//  mathFlashCards
//
//  Created by Scott Courtney on 9/14/16.
//  Copyright © 2016 Scott Courtney. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

let BASE_URL = "https://mathflashcards-ab159.firebaseio.com"

//let FIREBASE_REF = Firebase(url: BASE_URL)
let FIREBASE_REF = FIRDatabase.database().reference()

var CURRENT_USER: FIRDatabaseReference {
    let userID = UserDefaults.standard.value(forKey: "uid")
    let currentUser = FIREBASE_REF.child(byAppendingPath: "users").child(byAppendingPath: userID as! String)
    return currentUser
}
