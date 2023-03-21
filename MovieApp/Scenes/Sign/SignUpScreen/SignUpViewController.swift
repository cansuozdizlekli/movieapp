//
//  SignUpViewController.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 3/19/23.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func signUpTapped(_ sender: Any) {
        if emailTextfield.text?.isEmpty == true {
            print("no text in email textfield")
            return
        }
        
        if passwordTextfield.text?.isEmpty == true {
            print("no text in email textfield")
            return
        }
        
        signUp()
    }
    
    
    func signUp(){
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { authResult, error in
            guard let user = authResult?.user, error == nil else{
                print("Error 1 \(String(describing: error?.localizedDescription))")
                return
            }
        }
        if Auth.auth().currentUser != nil {
            print("cansu1 yeni sayfa acılıs")
            let vc = TabBarController()
            self.presentVC(to: TabBarController())
        }
        
    }

    
    
    
}
