//
//  ViewController.swift
//  DiaTracker
//
//  Created by yasamin  on 20.1.2017.
//  Copyright © 2017 yasamin. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var signInSelector: UISegmentedControl!
    
    @IBOutlet weak var signInLabel: UILabel!

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    var isSignIn:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //we gonna check if there is a current user
        
               // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        
        //flip the boolean
        isSignIn = !isSignIn
        
        //check the bool and set the buttons and labels
        if isSignIn {
            signInLabel.text = "Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        }
        else {
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
    }
    
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
        if let email = emailTextField.text, let pass = passwordTextField.text {
        
        
        //check if its sign in or register
        
        if isSignIn {
            //sign in the user wirth firebase
            FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: {(
                user, error) in
                //check that user isnt nil
                if let u = user {
                    //go to home screen
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                }
                else {
                    //error, check e rror
                }
            })
        }
        else {
            //Register the user with firebase
            FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion: {(
                user, error) in
                
                //check if user isnt nil
                if let u = user {
                    //go to home screen
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                }
                else {
                    //error, check error
                }

            })
            
        }
    }
    
}

}
