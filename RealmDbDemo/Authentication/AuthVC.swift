    //
    //  AuthVC.swift
    //  RealmDbDemo
    //
    //  Created by user on 13/11/2022.
    //

import UIKit
import FirebaseAuth

class AuthVC: UIViewController {
    
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
            // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnLoginTapped(_ sender: UIButton) {
        if let userMail = userNameTxtField.text,
           let  pwd = passwordTxtField.text {
                // SIGN IN WITH EMAIL AND PWD
            let loginManger = FirebaseAuthManager()
            loginManger.logInUser(with: userMail, andPassword: pwd) { userEmail, error in
                if let error = error {
                    let alert = UIAlertController(title: "Log In Failed", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    if let userEmail = userEmail {
                        let alert = UIAlertController(title: "LOG IN SUCCESS", message: "Welcome \(userEmail)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func btnRegisterTapped(_ sender: UIButton) {
        let signUpManager = FirebaseAuthManager()
        if let email = userNameTxtField.text, let pwd = passwordTxtField.text {
            signUpManager.createUser(with: email, andPassword: pwd) {  success, error in
                var msg: String = ""
                
                if (success) {
                    msg = "User created successfully"
                } else {
                    msg = "There was an error : \(String(describing: error?.localizedDescription))"
                }
                let alertController = UIAlertController(title: "OK", message: msg, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OKAY", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
}
