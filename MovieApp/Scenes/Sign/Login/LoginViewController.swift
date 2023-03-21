//
//  LoginViewController.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 3/19/23.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    private func validateFeilds(){
        if emailTextfield.text?.isEmpty == true {
            print("no text in email textfield")
            return
        }
        if passwordTextfield.text?.isEmpty == true {
            print("no text in email textfield")
            return
        }
        login()
        
    }
    
    private func login(){
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { [weak self] authResult, err in
            guard self != nil else {return}
            if let err = err {
                print(err.localizedDescription)
            }
            self!.checkUserInfo()
        }
    }
    
    private func checkUserInfo(){
        if Auth.auth().currentUser != nil {
//            print(Auth.auth().currentUser?.uid)
            self.presentVC(to: TabBarController())

        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        validateFeilds()
    }


    

}
