//
//  SpotReviewTableViewCell.swift
//  Snacktacular
//
//  Created by Samuel Pena on 6/29/22.
//  Copyright © 2022 Samuel Pena. All rights reserved.
//

import UIKit

class SpotReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewTitleLabel: UILabel!
    @IBOutlet weak var reviewTextLabel: UILabel!
    
    var review: Review! {
        didSet {
            reviewTitleLabel.text = review.title
            reviewTextLabel.text = review.text
        }
    }
    
}
