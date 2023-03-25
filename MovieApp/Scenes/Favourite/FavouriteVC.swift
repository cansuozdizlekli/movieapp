//
//  FavouriteVC.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/10/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class FavouriteVC: UIViewController {
    
    var favMovieCount : Int = 0
    var favMovieItemList = [MovieResult]()
    var favMovieItem: MovieResult!
    @IBOutlet weak var favMoviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataByUserEmail()
        setupTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchDataByUserEmail()
    }
    
    
    private func fetchDataByUserEmail(){
        print("fetch data icinde")
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser
        if let user = user {
            print("userım",user.email!)
            db.collection("Favourite Movie List").document("Emails").collection(user.email!).getDocuments() { (querySnapshot, error) in
                if let error = error {
                     print("Error getting documents: \(error)")
                } else {
                    self.favMovieCount = querySnapshot!.count
                    self.favMoviesTableView.reloadData()
                     for document in querySnapshot!.documents {
                         print("fetch anan")
//                         print("kac film var",querySnapshot?.count)
                         print("filmin ozellikleri",document.data())
//                         favMovieItem.posterImage = document.data()["posterImage"] as? String ?? ""
                          print("\(document.documentID): \(document.data())")
                     }
                }
            }
        }
    }
    
    
    
    private func setupTableView() {
        favMoviesTableView.dataSource = self
        favMoviesTableView.delegate = self
        favMoviesTableView.showsVerticalScrollIndicator = false
        favMoviesTableView.register(PopularTableViewCell.nib, forCellReuseIdentifier: PopularTableViewCell.identifier)
        favMoviesTableView.backgroundColor = .systemRed
    }

}
    

   
extension FavouriteVC: UITableViewDelegate, UITableViewDataSource , PopularTableViewCellDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favMovieCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularTableViewCell.identifier, for: indexPath) as? PopularTableViewCell else {
            fatalError()
        }
        cell.delegate = self
        

        return cell
    }
}

