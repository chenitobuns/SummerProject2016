//
//  AddPostViewController.swift
//  SummerProject2016
//
//  Created by Dustin Guo on 7/27/16.
//  Copyright © 2016 Kevin Chen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage
import Foundation

class AddPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var addedImg: UIImageView!
    @IBOutlet weak var uploadBtn: UIStackView!
    @IBOutlet weak var addedTitle: UITextField!
    @IBOutlet weak var addedDesc: UITextField!
    @IBOutlet weak var addedPrice: UITextField!
    @IBOutlet weak var publishBtn: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    private var createdPost: GenPost?
    
    private var dbRef: FIRDatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        dbRef = FIRDatabase.database().reference().child("addedPosts")
        
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        addedImg.image = image
    }
    
    
    @IBAction func addImage(sender: AnyObject!) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*lazy var addedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "up-arrow")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .ScaleAspectFill
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectAddedImageView)))
        imageView.userInteractionEnabled = true
        
        return imageView
    }()
    
    func handleSelectAddedImageView() {
        print("kek")
    } */
    


    @IBAction func publishBtnTapped(sender: AnyObject) {
        createdPost = GenPost(postDesc: addedDesc.text!,
                              postTitle: addedTitle.text!,
                              postPrice: addedPrice.text!,
                              addByOwner: (FIRAuth.auth()?.currentUser?.displayName!)!)
                              
        
        let postRef = self.dbRef.child((createdPost?.postTitle.lowercaseString)!)
        
        postRef.setValue(createdPost!.toAnyObject())
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
