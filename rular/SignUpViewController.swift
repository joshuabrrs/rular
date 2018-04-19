//
//  SignUpViewController.swift
//  rular
//
//  Created by Joshua Barrios on 4/13/18.
//  Copyright © 2018 Joshua Barrios. All rights reserved.
//

import UIKit
import Firebase
class SignUpViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailtextfield: UITextField!
    @IBOutlet weak var pwtextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    registerButton.layer.cornerRadius = 25
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func registerPressed(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailtextfield.text!, password: pwtextfield.text!) { (user, error) in
            if error != nil {
                print(error!)
            }
            else {
                print("success")
                performSegue(withIdentifier: "newSignUp", sender: self)
            }
        }
    }
    
  

}
