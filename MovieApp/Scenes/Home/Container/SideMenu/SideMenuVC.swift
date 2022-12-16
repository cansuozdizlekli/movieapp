//
//  SideMenuVC.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/10/22.
//

import UIKit

class SideMenuVC: UIViewController {
    
    var movies = [Movie]()
    
    var menus : [Genres] = [Genres.action, .animation, .adventure, .comedy, .crime, .documentary, .drama, .family, .fantasy, .horror, .history, .music, .mystery, .romance, .scienceFiction, .thriller, .tvMovie, .western, .war]
   
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setupTableView()
        
    }
    
    private func setUpUI(){
        view.backgroundColor = .systemGray
        view.frame.size.height = screenHeight
//        (tabBarController?.tabBar.frame.height)!
        view.frame.size.width = screenWidth - 133
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner]
    }
    
    private func setupTableView() {
        tableView.register(MovieTypeTableViewCell.nib, forCellReuseIdentifier: MovieTypeTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension SideMenuVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(menus.count)
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTypeTableViewCell.identifier, for: indexPath) as? MovieTypeTableViewCell else {
            fatalError()
        }
        
        let menu = menus[indexPath.row]
        print("deneme",menu.title)
        cell.movieGenreLabel?.text = menu.title
        
        let backgroundColorView = UIView()
        backgroundColorView.backgroundColor = UIColor.lightestBlue
        cell.selectedBackgroundView = backgroundColorView
        
        
        return cell
    }
    
}
