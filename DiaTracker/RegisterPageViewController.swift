//
//  RegisterPageViewController.swift
//  DiaTracker
//
//  Created by yasamin  on 21.1.2017.
//  Copyright © 2017 yasamin. All rights reserved.
//

import UIKit
import Firebase

class RegisterPageViewController: UIViewController {
    
    @IBOutlet weak var Label1: UILabel!
    
    @IBOutlet weak var UsernameLabel: UILabel!
    
    @IBOutlet weak var UserEmail: UITextField!

    @IBOutlet weak var UserPassword: UITextField!
    
    @IBOutlet weak var LogoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = FIRAuth.auth()?.currentUser
        {
            //if user is not nil (logged in) the logout button is showed to the user
            self.LogoutButton.alpha = 1.0
            self.UsernameLabel.text = user.email
            
        }
        else {
//            self.LogoutButton.alpha = 0.5
//            
//            self.UsernameLabel.text = ""
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func LogoutAction(_ sender: Any) {
        
        try! FIRAuth.auth()?.signOut()
        
        self.UsernameLabel.text = ""
        self.LogoutButton.alpha = 0.0
        self.UserEmail.text = ""
        self.UserPassword.text = ""
    }
    
    @IBAction func LoginAction(_ sender: Any) {
        
        if (self.UserEmail.text == "" || self.UserPassword.text == "") {
            
            
            let alertController = UIAlertController(title: "Alert", message:"All fields are needed"
                , preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { action in
                
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        else {
            FIRAuth.auth()?.signIn(withEmail: self.UserEmail.text!, password: self.UserPassword.text!, completion: { (user, error) in
                if error == nil {
                    self.LogoutButton.alpha = 1.0
                    self.UsernameLabel.text = user!.email
                    self.UserEmail.text = ""
                    self.UserPassword.text = ""
                }
                else {
                    let alertController = UIAlertController(title: "Alert", message:error?.localizedDescription
                        , preferredStyle: UIAlertControllerStyle.alert)
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { action in
                        
                    }
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                
            })
        }
    }
    
    
    @IBAction func RegisterButtonTapped(_ sender: Any) {
        
        //check for empty fields
        
        if (self.UserEmail.text == "" || self.UserPassword.text == "") {
        
            
            let alertController = UIAlertController(title: "Alert", message:"All fields are needed"
                , preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { action in
                
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)

            }
        
        else{
            
            FIRAuth.auth()?.createUser(withEmail: self.UserEmail.text!, password: self.UserPassword.text!, completion: { (user, error) in
                
                if error == nil {
                    self.LogoutButton.alpha = 1.0
                    self.UsernameLabel.text = user!.email
                    self.UserEmail.text = ""
                    self.UserPassword.text = ""
                }
                else {
                    let alertController = UIAlertController(title: "Alert", message:error?.localizedDescription
                        , preferredStyle: UIAlertControllerStyle.alert)
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { action in
                        
                    }
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                
    })
}
        
}
}
