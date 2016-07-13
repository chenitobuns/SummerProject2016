//
//  MaterialTextField.swift
//  UPanda_Official
//
//  Created by Kevin Chen on 7/12/16.
//  Copyright © 2016 Kevin Chen. All rights reserved.
//

import Foundation
import UIKit

class MaterialTextField: UITextField{
    
    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.borderColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.1).CGColor
        layer.borderWidth = 1.0
    }
    //for placeholder
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 0)
    }
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 0)
    }
}