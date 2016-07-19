//
//  parentPost.swift
//  pandaModel
//
//  Created by Dustin Guo on 7/11/16.
//  Copyright © 2016 Ares. All rights reserved.
//

import Foundation
import UIKit

class ParentPost {

    private var _postDesc : String = "No description listed."
    private var _postTitle : String = "No title listed."
    private var _postPrice : String = "No price listed."
    
    private var _ownerFirstName: String = "Anonymous"
    private var _ownerLastName: String = "Anonymous"
    private var _ownerUser: GenUser
    
    private var _NSDateCreated: NSDate
    
    //initializers, takes title(String), description(String) and owner(GenUser)
    init(initDesc: String, initTitle: String, owner: GenUser) {
        self._postDesc = initDesc
        self._postTitle = initTitle
        
        self._ownerFirstName = owner.firstName
        self._ownerLastName = owner.lastName
        self._ownerUser = owner
        
        self._NSDateCreated = NSDate()
    }
    
    private func dateToString(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .ShortStyle
        return dateFormatter.stringFromDate(date)
    }
    
    //getters and setters
    var postDesc : String {
        get {
            let returnDesc = _postDesc
            return returnDesc
        }
        set (newPostDesc) {
            self._postDesc = newPostDesc
        }
    }
    
    var postTitle : String {
        get {
            let returnTitle = _postTitle
            return returnTitle
        }
        set (newPostTitle) {
            self._postTitle = newPostTitle
        }
    }
    
    var postPrice : String {
        get {
            let returnPrice = _postPrice
            return returnPrice
        }
        set (newPostPrice) {
            self._postPrice = newPostPrice
        }
    }

    var ownerFirstName: String {
        get {
            let returnFirstName = _ownerFirstName
            return returnFirstName
        }
    }
    
    var ownerLastName: String {
        get {
            let returnLastName = _ownerLastName
            return returnLastName
        }
    }
    
    var ownerUser: GenUser {
        get {
            let returnUser = _ownerUser
            return returnUser
        }
    }
    
    var NSDateCreated: NSDate {
        get {
            let returnNSDate = _NSDateCreated
            return returnNSDate
        }
    }
    
    var formattedDateCreated: String {
        let formatNSDate = _NSDateCreated
        return dateToString(formatNSDate)
    }
    
    
    
    
    
    
}