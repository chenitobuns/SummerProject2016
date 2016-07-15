//
//  MaterialView.swift
//  UPanda_Official
//
//  Created by Kevin Chen on 7/14/16.
//  Copyright © 2016 Kevin Chen. All rights reserved.
//

import Foundation
import UIKit

class MaterialView: UIView {
    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0 , 2.0)
    }
}