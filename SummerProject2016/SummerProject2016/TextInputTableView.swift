//
//  TextInputTableView.swift
//  SummerProject2016
//
//  Created by Kevin Chen on 7/22/16.
//  Copyright © 2016 Kevin Chen. All rights reserved.
//

import UIKit

public class TextInputTableView: UITableViewCell{
    
    
    
    @IBOutlet weak var myTextField: UITextField!
    
    public func configure(text:String?, placeholder:String?){
        
        myTextField.text = text
        myTextField.placeholder = placeholder
        
    }
    
    
    
    
}
