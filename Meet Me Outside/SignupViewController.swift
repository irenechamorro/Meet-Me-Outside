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
        // Creating an animation to shake the textfield if there is an error.
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.4
        animation.isAdditive = true
        
        Auth.auth().createUser(withEmail: signupEmailField.text!, password: signupPasswordField.text!) {
            authResult, error in
            if let error = error as NSError? {
                self.signupPasswordField.layer.add(animation, forKey: "shake")
                print("\(error.localizedDescription)")
            } else {
                print("successfully created user")
            }
        }
    }
    
    @IBAction func signInWithGoogle(_ sender: Any) {
    }
   

}
