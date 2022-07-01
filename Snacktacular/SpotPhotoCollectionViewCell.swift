//
//  SpotPhotoCollectionViewCell.swift
//  Snacktacular
//
//  Created by Samuel Pena on 7/1/22.
//  Copyright © 2022 Samuel Pena. All rights reserved.
//

import UIKit

class SpotPhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    
    var spot: Spot!
    var photo: Photo! {
        didSet {
            photo.loadImage(spot: spot) { (success) in
                if success {
                    self.photoImageView.image = self.photo.image
                } else {
                    print("😡 ERROR: no success in loading photo in SpotPhotoCollectionViewCell")
                }
            }
        }
    }
}
