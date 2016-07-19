//
//  genUser.swift
//  pandaModel
//
//  Created by Dustin Guo on 7/11/16.
//  Copyright © 2016 Ares. All rights reserved.
//

import Foundation

class GenUser {
    
    private var _firstName : String
    private var _lastName : String
    
    init (firstName: String, lastName: String) {
        self._firstName = firstName
        self._lastName = lastName
    }
    
    //getters & setters
    var firstName : String {
        get {
            return _firstName
        }
    }
    
    var lastName : String {
        get {
            return _lastName
        }
    }
}