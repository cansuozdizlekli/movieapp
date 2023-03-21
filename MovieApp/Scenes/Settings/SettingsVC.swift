//
//  SettingsVC.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/10/22.
//

import UIKit
import Firebase
import FirebaseAuth

class SettingsVC: UIViewController {

    private let logoutButton: UIButton = {
        let button = UIButton(frame: CGRect(x: screenWidth - 65, y: 75, width: 50, height: 50))
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, reqAlpha: 0.2)
        button.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right",withConfiguration: UIImage.SymbolConfiguration(pointSize: 17)), for: UIControl.State.normal)
        button.tintColor = .primaryWhite
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.4
        button.layer.cornerRadius = 25
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()

        
    }
    
    private func setUpUI(){
        view.addSubview(logoutButton)
        logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        
        
    }
    
    @objc func logout(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            UserDefaults.standard.removeObject(forKey: "isFirstTime")
            SceneDelegate.window?.rootViewController = FirstViewController()
            //        self.presentVC(to: FirstVC())
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
        
    }


   

}
