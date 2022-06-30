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
}
