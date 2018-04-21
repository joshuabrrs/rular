//
//  LoginViewController.swift
//  rular
//
//  Created by Joshua Barrios on 4/13/18.
//  Copyright © 2018 Joshua Barrios. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var pwTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //pers

    @IBAction func loginPressed(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: pwTextfield.text!) { (user, error) in
            if error != nil {
                print (error!)
            }
            else{
                print("success")
                self.performSegue(withIdentifier: "goToAR", sender: self)
          
            }
        }
    }


}
