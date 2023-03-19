//
//  FirstViewController.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 3/19/23.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    private func setUpUI(){
        signUpButton.layer.cornerRadius = 30
        signUpButton.layer.masksToBounds = true
        
    }


    @IBAction func signUpButtonClicked(_ sender: Any) {
        self.presentVC(to: TabBarController())
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        self.presentVC(to: LoginViewController())
        
    }
}
