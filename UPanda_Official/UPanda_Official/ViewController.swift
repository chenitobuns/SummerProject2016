//
//  ViewController.swift
//  UPanda_Official
//
//  Created by Kevin Chen on 7/13/16.
//  Copyright © 2016 Kevin Chen. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class ViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func fbBtnPressed(sender: UIButton){
        let facebookLogin = FBSDKLoginManager()
        //facebookLogin.logInWithReadPermissions(["email"]) { (facebookResult: FBSDKLoginManagerLoginResult!, facebookError: NSError!)-> Void in
        facebookLogin.logInWithReadPermissions( [ "email" ], fromViewController: self ) { ( facebookResult: FBSDKLoginManagerLoginResult!, facebookError: NSError!) -> Void in
            if facebookError != nil {
                print("Facebook Login Failed. Error \(facebookError)")
            } else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                print("Successfully logged in with Facebook. \(accessToken)")
            }
        }
}
    
    /*@IBAction func attemptLogin(sender: UIButton!){
        if let email = emailField.text where email != "", let pwd = passwordField.text where pwd != "" {
            
            FIRAuth.auth()?.signInWithEmail(email, password: pwd, completion: {(user, error) in
                if error != nil {
                    print(error)
                    if error!.code == STATUS_ACCOUNT_NONEXIST {
                        //DataService.ds.REF_BASE.createUser(email, password: pwd, withValueCompletionBlock: {error, result in
                        FIRAuth.auth()?.createUserWithEmail(email, password: pwd, completion: {(user, error) in
                            if error != nil {
                                self.showErrorAlert("Could not create account", msg: "Problem Creating account, try something else")
                            } else {
                                NSUserDefaults.standardUserDefaults().setValue(user!.uid, forKey: KEY_UID)
                                
                                let userData = ["provider": "email"]
                                DataService.ds.createFirebaseUser(user!.uid , user: userData)
                                self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                            }
                        })
                    } else {
                        self.showErrorAlert("Could not log in", msg: "Please check your username or password")
                    }
                } else {
                    self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                }
            })
        
        
            } else{
            showErrorAlert("Email and Password Required", msg: "You must enter a school email and a password")}
    }
        
        func showErrorAlert(title: String, msg: String){
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
}*/
}

