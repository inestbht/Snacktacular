//
//  Reviews.swift
//  Snacktacular
//
//  Created by Samuel Pena on 6/29/22.
//  Copyright © 2022 Samuel Pena. All rights reserved.
//

import Foundation
import Firebase

class Reviews {
    var reviewArray: [Review] = []
    
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func loadData(spot: Spot, completed: @escaping () -> ()) {
        guard spot.documentID != "" else {
            return
        }
        db.collection("spots").document(spot.documentID).collection("reviews").addSnapshotListener { (querySnapshot, error) in
            guard error == nil else {
                print("😡 ERROR: adding the snapshot listener \(error!.localizedDescription)")
                return completed()
            }
            self.reviewArray = [] // clean out existing spotArray since new data will load
            // there are querySnapshots!.documents.count documents in the snapshot
            print("*** there are \(querySnapshot!.documents.count) documents in the reviews snapshot for \(spot.name)")
            for document in querySnapshot!.documents {
                // You'll have to be sure you've created an initializer in the singular class (Spot, below) that accepts a dictionary.
                let review = Review(dictionary: document.data())
                review.documentID = document.documentID
                self.reviewArray.append(review)
            }
            completed()
        }
    }
}
