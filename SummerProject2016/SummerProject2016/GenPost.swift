//
//  GenPost.swift
//  SummerProject2016
//
//  Created by Dustin Guo on 7/25/16.
//  Copyright © 2016 Kevin Chen. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class GenPost {
    
    let _key: String!
    let _addByOwner: String!
    
    private var _postDesc : String!
    private var _postTitle : String!
    private var _postPrice : String!
    
    let _postRef: FIRDatabaseReference?
    
    let _NSDateCreated: String!
    
    init(postDesc: String, postTitle: String, postPrice: String, addByOwner: String, key: String = ""){
        self._key = key
        self._addByOwner = addByOwner
        self._postDesc = postDesc
        self._postPrice = postPrice
        self._postTitle = postTitle
        self._NSDateCreated = dateToString(NSDate())
        self._postRef = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        _key = snapshot.key
        _postRef = snapshot.ref
        
        if let postDesc = snapshot.value!["postDesc"] as? String {
            _postDesc = postDesc
        } else {
            _postDesc = "No description added"
        }
        
        if let postTitle = snapshot.value!["postTitle"] as? String {
            _postTitle = postTitle
        } else {
            _postTitle = "No title added"
        }
        
        if let postPrice = snapshot.value!["postPrice"] as? String {
            _postPrice = postPrice
        } else {
            _postPrice = "No price added"
        }
        
        if let NSDateCreated = snapshot.value!["NSDateCreated"] as? String {
            _NSDateCreated = NSDateCreated
        } else {
            _NSDateCreated = "Post date not added"
        }
        
        if let addByOwner = snapshot.value!["addByOwner"] as? String {
            _addByOwner = addByOwner
        } else {
            _addByOwner = "Created by anonymous"
        }
    }
    
    //date to string helper function
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