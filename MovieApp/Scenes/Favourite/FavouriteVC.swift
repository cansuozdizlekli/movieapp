//
//  FavouriteVC.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/10/22.
//

import UIKit
import FirebaseFirestore

class FavouriteVC: UIViewController {

    private var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func fetchDataByUserEmail(){
//        db.collection("Fav Movies").getDocuments { document , error in
//            if let document = document {
//                let dataDescription = document.data ?? "nil"
//                    print("Document data: \(dataDescription)")
//                } else {
//                    print("Document does not exist")
//                }
//        }
        
    }

    

}
    

   


