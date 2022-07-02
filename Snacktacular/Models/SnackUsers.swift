//
//  SnackUsers.swift
//  Snacktacular
//
//  Created by Samuel Pena on 7/2/22.
//  Copyright © 2022 Samuel Pena. All rights reserved.
//

import Foundation
import Firebase

class SnackUsers {
    var userArray: [SnackUser] = []
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func loadData(completed: @escaping () -> ()) {
        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            guard error == nil else {
                print("😡 ERROR: adding the snapshot listener \(error!.localizedDescription)")
                return completed()
            }
            self.userArray = [] // clean out existing usrArray since new data will load
            // there are querySnapshots!.documents.count documents in the snapshot
            for document in querySnapshot!.documents {
                // You'll have make sure you have a dictionary initializer in the singular class
                let snackUser = SnackUser(dictionary: document.data())
                snackUser.documentID = document.documentID
                self.userArray.append(snackUser)
            }
            completed()
        }
    }
}
