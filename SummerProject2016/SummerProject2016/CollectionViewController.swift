//
//  CollectionViewController.swift
//  SummerProject2016
//
//  Created by Kevin Chen on 7/26/16.
//  Copyright © 2016 Kevin Chen. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var addPostBtn: UIBarButtonItem!
    private var postArr = [GenPost]()
   
    @IBAction func addPostBtnTapped(sender: AnyObject) {
        performSegueWithIdentifier("addPostBtnSegue", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "The Bazaar"
        navigationController?.navigationBar.translucent = false
        
        let titleLabel = UILabel(frame: CGRectMake(0, 0, view.frame.width - 32, view.frame.height))
        titleLabel.text = "The Bazaar"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.systemFontOfSize(20)
        navigationItem.titleView = titleLabel
        collectionView?.backgroundColor = UIColor.whiteColor()
        
        collectionView?.registerClass(VideoCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postArr.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSizeMake(view.frame.width, height + 16 + 68)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
}

