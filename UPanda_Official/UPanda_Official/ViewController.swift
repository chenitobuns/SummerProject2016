//
//  ViewController.swift
//  UPanda_Official
//
//  Created by Kevin Chen on 7/13/16.
//  Copyright © 2016 Kevin Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func attemptLogin(sender: UIButton!){
        if let email = emailField.text where email != "", let pwd = passwordField.text where pwd != "" {
        } else{
            showErrorAlert("Email and Password Required", msg: "You must enter a school email and a password")}
    }
        
        func showErrorAlert(title: String, msg: String){
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
}

