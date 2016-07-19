//
//  userPost.swift
//  pandaModel
//
//  Created by Dustin Guo on 7/11/16.
//  Copyright © 2016 Ares. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class OwnerPost: ParentPost {
    private var _ownerUser: GenUser
    private var _postTags : Set<PostTag> = []
    
    //initialize with an owner, description, and title
    init(postDesc: String, postTitle: String, owner: GenUser) {
        self._ownerUser = owner
        super.init(initDesc: postDesc, initTitle: postTitle, owner: owner)
        
        let entityDescription = NSEntityDescription.entityForName("GenPost", inManagedObjectContext: self.managedObjectContext)
    }
    
    //functions for editing post fields
    func editPostDesc(newPostDesc: String?) {
        if (newPostDesc != nil) { self.postDesc = newPostDesc! }
    }
    
    func editPostTitle(newPostTitle: String?) {
        if (newPostTitle != nil) { self.postTitle = newPostTitle! }
    }
    
    func editPostPrice(newPrice: String?) {
        let notNumbers = NSCharacterSet.decimalDigitCharacterSet().invertedSet
        if (newPrice != nil && newPrice?.rangeOfCharacterFromSet(notNumbers) == nil) {
            super.postPrice = newPrice! }
    }
    
    func editPostPrice(newPrice: Int?) {
        if (newPrice != nil) { super.postPrice = "\(newPrice!)" }
    }
    
    //TAGS
    
    //add tags
    func addPostTags(tagsToAdd: [PostTag]) {
        for tag in tagsToAdd {
            if !(_postTags.contains(tag)) {
                _postTags.insert(tag)
            }
        }
    }
    
    //remove tags
    func removePostTags(tagToRemove: PostTag) {
        _postTags.remove(tagToRemove)
    }
    
    
}
