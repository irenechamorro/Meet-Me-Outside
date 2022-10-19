//
//  LoginViewController.swift
//  Meet Me Outside
//
//  Created by Matthew Molinar on 10/19/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginEmailField: UITextField!
    @IBOutlet weak var loginPasswordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make it to where the text entered is dots
        loginPasswordField.isSecureTextEntry = true
        // MARK: - Segue to home screen
        Auth.auth().addStateDidChangeListener() {
            auth, user in
            if user != nil {
                self.performSegue(withIdentifier: "homeScreenSegue", sender: nil)
                // Delete what was typed in the text fields
                self.loginEmailField.text = nil
                self.loginPasswordField.text = nil
            }
        }
        
    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        // Sign in the user
        
        Auth.auth().signIn(withEmail: loginEmailField.text!, password: loginPasswordField.text!) {
            // callback, just boilerplate - useful for error checking.
            (authResult, error) in
            if let error = error as NSError? {
                print("\(error.localizedDescription)")
            } else {
               print("login successful")
            }
        }
    }
}
