//
//  ProfileTableViewController.swift
//  SummerProject2016
//
//  Created by Kevin Chen on 7/22/16.
//  Copyright © 2016 Kevin Chen. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase


class ProfileTableViewController: UITableViewController {
    
    var about = ["Gender", "Age", "Phone", "Email", "Website", "Bio"]
    var ref = FIRDatabase.database().reference()
    var user = FIRAuth.auth()?.currentUser
    
    @IBAction func didTapUpdate(sender: AnyObject) {
        
        var index = 0
        while index<about.count{
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            let cell: TextInputTableView? = self.tableView.cellForRowAtIndexPath(indexPath) as! TextInputTableView
            
            
            if cell?.myTextField.text != ""{
                let item: String = (cell?.myTextField.text!)!
                
                switch about[index]{
                    case "Gender":
                    self.ref.child("user_profile").child("\(user!.uid)/gender").setValue(item)
                    case "Age":
                    self.ref.child("user_profile").child("\(user!.uid)/age").setValue(item)
                    
                    case "Phone":
                    self.ref.child("user_profile").child("\(user!.uid)/phone").setValue(item)

                    
                    case "Email":
                    self.ref.child("user_profile").child("\(user!.uid)/email").setValue(item)
                    
                    case "Website":
                    self.ref.child("user_profile").child("\(user!.uid)/website").setValue(item)
                    
                    case "Bio":
                    self.ref.child("user_profile").child("\(user!.uid)/bio").setValue(item)

                    
                default:
                    print("Don't Update")
                    
                }//end switch
            
            }//end if
            
            index+=1
            
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        
        var refHandle = self.ref.child("user_profile").observeEventType(FIRDataEventType.Value, withBlock: { (snapshot) in
            
            let usersDict = snapshot.value as! NSDictionary
            
            print(usersDict)
            let userDetails = usersDict.objectForKey(self.user!.uid)
            
            var index = 0
            while index<self.about.count{
                let indexPath = NSIndexPath(forRow: index, inSection: 0)
                let cell: TextInputTableView? = self.tableView.cellForRowAtIndexPath(indexPath) as! TextInputTableView?
                
                
                let field: String = (cell?.myTextField.placeholder?.lowercaseString)!
                
                    
                    switch field{
                    case "gender":
                        cell?.configure(userDetails?.objectForKey("gender") as? String, placeholder: "Sex")
                    case "age":
                        cell?.configure(userDetails?.objectForKey("age") as? String, placeholder: "Age")
                        
                    case "phone":
                        cell?.configure(userDetails?.objectForKey("phone") as? String, placeholder: "Phone")
                        
                        
                    case "email":
                        cell?.configure(userDetails?.objectForKey("email") as? String, placeholder: "Email")
                        
                    case "website":
                        cell?.configure(userDetails?.objectForKey("website") as? String, placeholder: "Website")
                        
                    case "bio":
                        cell?.configure(userDetails?.objectForKey("bio") as? String, placeholder: "Bio")
                        
                        
                    default:
                        ""
                        
                    }//end switch
                
                
                index+=1

                
            }
            // ...
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return about.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell: TextInputTableView = tableView.dequeueReusableCellWithIdentifier("TextInput", forIndexPath: indexPath) as! TextInputTableView
        cell.configure("", placeholder: "\(about[indexPath.row])")
        return cell
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
