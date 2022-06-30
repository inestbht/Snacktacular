//
//  UIBarButtonItem+hide.swift
//  Snacktacular
//
//  Created by Samuel Pena on 6/30/22.
//  Copyright © 2022 Samuel Pena. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    func hide() {
        self.isEnabled = false
        self.tintColor = .clear
    }
}
