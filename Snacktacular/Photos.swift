//
//  Photos.swift
//  Snacktacular
//
//  Created by Samuel Pena on 7/1/22.
//  Copyright © 2022 Samuel Pena. All rights reserved.
//

import Foundation
import Firebase

class Photos {
    var photoArray: [Photo] = []
    
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func loadData(spot: Spot, completed: @escaping () -> ()) {
        guard spot.documentID != "" else {
            return
        }
        db.collection("spots").document(spot.documentID).collection("photos").addSnapshotListener { (querySnapshot, error) in
            guard error == nil else {
                print("😡 ERROR: adding the snapshot listener \(error!.localizedDescription)")
                return completed()
            }
            self.photoArray = [] // clean out existing photoArray since new data will load
            // there are querySnapshots!.documents.count documents in the snapshot
            for document in querySnapshot!.documents {
                // You'll have to be sure you've created an initializer in the singular class (Spot, below) that accepts a dictionary.
                let photo = Photo(dictionary: document.data())
                photo.documentID = document.documentID
                self.photoArray.append(photo)
            }
            completed()
        }
    }
}
