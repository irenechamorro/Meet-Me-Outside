//
//  HomeViewController.swift
//  Meet Me Outside
//
//  Created by Matthew Molinar on 10/19/22.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {


    @IBOutlet weak var temporaryAuthLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener() {
            auth, user in
            if user != nil {
                let userEmail = user?.email!
                print(userEmail!)
            }
            
        
        }
        
    }
    
    // Remove the listener once it's no longer needed
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true)
        } catch {
            let logoutErrorAlert = UIAlertController(title: "Logout Error", message: "Unexpected error, screenshot for developer", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default)
            logoutErrorAlert.addAction(OKAction)
            present(logoutErrorAlert, animated: true)
        }
    }
    
 

}
