//
//  UserModel.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 3/21/23.
//

import Foundation

struct UserModel {
    let uid: String
    let username: String
    let email: String
    
    init(uid: String, dict: [String: Any]) {
        self.uid = uid
        self.username = dict["username"] as? String ?? ""
        self.email = dict["email"] as? String ?? ""
    }
}
