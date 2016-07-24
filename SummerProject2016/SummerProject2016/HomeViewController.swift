//
//  HomeViewController.swift
//  SummerProject2016
//
//  Created by Kevin Chen on 7/21/16.
//  Copyright © 2016 Kevin Chen. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FirebaseAuth
import FirebaseStorage

class HomeViewController: UIViewController {
    
    
    //MARK: Properties
    
    @IBOutlet weak var uiimvProfilePic: UIImageView!
    
    @IBOutlet weak var uilName: UILabel!
    
    
    
    //MARK: Actions
    @IBAction func didTapLogout(sender: AnyObject) {
            //signs out of firebase
            try! FIRAuth.auth()!.signOut()
        
            //signs out of facebook
            FBSDKAccessToken.setCurrentAccessToken(nil)
        
            //moves user back to login
            let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
            let viewController: UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("LoginView")
            self.presentViewController(viewController, animated: true, completion: nil)

        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiimvProfilePic.layer.cornerRadius = self.uiimvProfilePic.frame.size.width/2
        self.uiimvProfilePic.clipsToBounds = true
        if let user = FIRAuth.auth()?.currentUser {
            // User is signed in.
            let name = user.displayName
            let email = user.email
            let photoUrl = user.photoURL
            let uid = user.uid;
            
            self.uilName.text = name
            //let data = NSData(contentsOfURL: photoUrl!)
            //self.uiimvProfilePic.image = UIImage(data: data!)
            
            //reference to storage service
            
            let storage = FIRStorage.storage()
            
            
            //refer to storage service
            let storageRef = storage.referenceForURL("gs://summerproject2016-c128a.appspot.com")
            
            let profilePicRef = storageRef.child(user.uid+"/profile_pic.jpg")
            
            profilePicRef.dataWithMaxSize(1 * 1024 * 1024) { (data, error) -> Void in
                if (error != nil) {
                    print("Unable to download image")
                } else {
                    if(data != nil){
                        print("User already has an image, no need to download from facebook.")
                        self.uiimvProfilePic.image = UIImage(data:data!)
                    }
                }
            }
            
            if(self.uiimvProfilePic.image == nil){
            
            var profilePic = FBSDKGraphRequest(graphPath: "me/picture", parameters: ["height": 300, "width": 300, "redirect": false], HTTPMethod: "GET")
                profilePic.startWithCompletionHandler({(connection, result, error) -> Void in
                    if(error == nil){
                        let dictionary = result as? NSDictionary
                        let data = dictionary?.objectForKey("data")
                        let urlPic = (data?.objectForKey("url"))! as! String
                        
                        if let imageData = NSData(contentsOfURL: NSURL(string:urlPic)!){
                            
                            let uploadTask = profilePicRef.putData(imageData, metadata: nil){
                                metadata,error in
                                
                                if(error == nil){
                                    let downloadUrl = metadata!.downloadURL
                                }
                                else{
                                    print("we have an error in downloading image, kek.")
                                }
                            }
                            
                            self.uiimvProfilePic.image = UIImage(data: imageData)
                            
                        }
                    }
                })
            }
            
            
            
        } else {
            // No user is signed in.
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
