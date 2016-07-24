//
//  ViewController.swift
//  SummerProject2016
//
//  Created by Kevin Chen on 7/21/16.
//  Copyright © 2016 Kevin Chen. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

class ViewController: UIViewController,FBSDKLoginButtonDelegate {

    var loginButton: FBSDKLoginButton = FBSDKLoginButton()
    
    
    @IBOutlet weak var aivLoadingSpinner: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginButton.hidden = true
        
        FIRAuth.auth()?.addAuthStateDidChangeListener { auth, user in
            if let user = user {
                // User is signed in.
                let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
                let homeViewController: UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("TabBarControllerView")
                self.presentViewController(homeViewController, animated: true, completion: nil)
                
            } else {
                // No user is signed in.
                self.loginButton.center = self.view.center
                self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
                self.loginButton.delegate = self;
                self.view!.addSubview(self.loginButton)
                self.loginButton.hidden = false
                
            }
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        print("User logged in")
        
        self.loginButton.hidden = true
        aivLoadingSpinner.startAnimating()
        
        
        if(error != nil){
            //handle errors here
            self.loginButton.hidden = false
            aivLoadingSpinner.stopAnimating()
        }
        else if(result.isCancelled){
            //handle the canceled event
            self.loginButton.hidden = false
            aivLoadingSpinner.stopAnimating()
        }
        else{
        
        let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
        
        FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
            print("User logged into Firebase app")
        }
    }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User did log out")
    }

}

