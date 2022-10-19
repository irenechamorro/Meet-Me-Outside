//
//  SignupViewController.swift
//  Meet Me Outside
//
//  Created by Matthew Molinar on 10/19/22.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {

    @IBOutlet weak var signupPasswordField: UITextField!
    @IBOutlet weak var signupEmailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener() {
            auth, user in
            if user != nil {
                self.performSegue(withIdentifier: "signupSegue", sender: nil)
                self.signupPasswordField.text = nil
                self.signupEmailField.text = nil
            }
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func signupButtonPressed(_ sender: Any) {
        Auth.auth().createUser(withEmail: signupEmailField.text!, password: signupPasswordField.text!) {
            authResult, error in
            if let error = error as NSError? {
                print("\(error.localizedDescription)")
            } else {
                print("successfully created user")
            }
        }
    }
    
    @IBAction func signInWithGoogle(_ sender: Any) {
    }
   

}
