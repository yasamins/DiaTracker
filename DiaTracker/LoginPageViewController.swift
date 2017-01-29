//
//  LoginPageViewController.swift
//  DiaTracker
//
//  Created by yasamin  on 21.1.2017.
//  Copyright © 2017 yasamin. All rights reserved.
//

import UIKit
import Firebase

class LoginPageViewController: UIViewController {
    
    @IBOutlet weak var UsernameText: UITextField!
    
    @IBOutlet weak var PasswordText: UITextField!
    
    
    @IBOutlet weak var LogoutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = FIRAuth.auth()?.currentUser
                {
            //if user logied in then show the logout button to the user
            self.LogoutButton.alpha = 1.0
            self.UsernameText.text = user.email
            

            
            
        }
        else {

        //when the user is not loged in
            self.LogoutButton.alpha = 0.0
            self.UsernameText.text = ""
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginTapped(_ sender: Any) {
        let Username = UsernameText.text;
        let Password = PasswordText.text;
        
        
        if (Username == "" || Password == "") {
            
            
            let alertController = UIAlertController(title: "Alert", message:"All fields are needed"
                , preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { action in
                
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func ForgotPassword(_ sender: Any) {
        
    }
    
    @IBAction func Logout(_ sender: Any) {
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
