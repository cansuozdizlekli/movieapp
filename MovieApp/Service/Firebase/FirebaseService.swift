//
//  FirebaseService.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 3/21/23.
//

import Foundation
import Firebase
import FirebaseAuth

class FIRService {
    static let shared = FIRService()

    func checkIfMovieInList(movieId: String, completion: @escaping (Int) -> ()) {
            guard let curUserId = getCurrentUserId() else { return }
            
            let ref = Database.database().reference().child("list")
            
            ref.child(curUserId).child(movieId).observeSingleEvent(of: .value, with: { (snap) in
                if let value = snap.value as? Int, value == 1 {
                    completion(1)
                } else {
                    completion(-1)
                }
                
            }) { (error) in
                completion(-1)
            }
            
        }
    
    func getCurrentUserId() -> String? {
            return Auth.auth().currentUser?.uid
        }
}
