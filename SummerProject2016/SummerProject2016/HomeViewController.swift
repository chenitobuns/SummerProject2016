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
            let data = NSData(contentsOfURL: photoUrl!)
            self.uiimvProfilePic.image = UIImage(data: data!)
            
        } else {
            // No user is signed in.
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
