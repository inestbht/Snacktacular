//
//  UIView+addBorder.swift
//  Snacktacular
//
//  Created by Samuel Pena on 6/30/22.
//  Copyright © 2022 Samuel Pena. All rights reserved.
//

import UIKit

extension UIView {
    func addBorder(width: CGFloat, radius: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = radius
    }
    
    func noBorder() {
        self.layer.borderWidth = 0.0
    }
}
