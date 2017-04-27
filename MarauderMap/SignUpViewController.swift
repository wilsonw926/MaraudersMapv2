//
//  SignUpViewController.swift
//  Marauder's Map
//
//  Created by Wilson Wang on 4/24/17.
//  Copyright © 2017 Wilson Wang. All rights reserved.
//
import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var ref:FIRDatabaseReference?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        ref = FIRDatabase.database().reference()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didAttemptSignup(_ sender: UIButton) {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        guard let name = nameField.text else { return }
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                let alert = UIAlertController(title: "Signup failed, try again", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Okay!", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                let changeRequest = user!.profileChangeRequest()
                changeRequest.displayName = name
                changeRequest.commitChanges(completion: { (err) in
                    if let error = err {
                        let alert = UIAlertController(title: "Signup failed, try again", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Okay!", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    } else {
                        self.performSegue(withIdentifier: "signupToMain", sender: self)
                    }
                })
                self.ref?.child("Users").childByAutoId().setValue(["Name": name])
                self.ref?.child("Users").childByAutoId().setValue(["Name": name])
            }})
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

