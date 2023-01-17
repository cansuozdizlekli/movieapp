//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/11/22.
//

import UIKit

var nowShowingMovies : [Movie] = [
    Movie(movieTitle: "Spiderman : No Way Home", movieImage: UIImage(named:"movie1")!, ratingTitle: "9.5/10 IMDb", genres: [Genres.horror,Genres.mystery,Genres.thriller], movieTime: "2h 13m", videoId: "KusPPRI8ubg", language: "English", rating: "PC-14", description: "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.", casts: [Cast(castImage: UIImage(named:"actor")!, castName: "Tom Holland"),Cast(castImage: UIImage(named: "actor2")!, castName: "İkinci cast"),Cast(castImage: UIImage(named:"actor")!, castName: "Tom Holland"),Cast(castImage: UIImage(named:"actor")!, castName: "Tom Holland"),Cast(castImage: UIImage(named:"actor")!, castName: "Tom Holland"),Cast(castImage: UIImage(named:"actor")!, castName: "Tom Holland"),Cast(castImage: UIImage(named:"actor")!, castName: "Tom Holland"),Cast(castImage: UIImage(named:"actor")!, castName: "Tom Holland")]),
    
    Movie(movieTitle: "Ethernals", movieImage: UIImage(named:"movie2")!, ratingTitle: "9.5/10 IMDb", genres: [Genres.horror,Genres.mystery,Genres.thriller], movieTime: "2h 13m", videoId: "KusPPRI8ubg", language: "English", rating: "PC-14", description: "Konu", casts: [Cast(castImage: UIImage(named:"movie2")!, castName: "Tom Holland")]),
    
    Movie(movieTitle: "Shang-Chi", movieImage: UIImage(named:"movie3")!, ratingTitle: "9.5/10 IMDb", genres: [Genres.horror,Genres.mystery,Genres.thriller], movieTime: "2h 13m", videoId: "KusPPRI8ubg", language: "English", rating: "PC-14", description: "Konu", casts: [Cast(castImage: UIImage(named:"movie2")!, castName: "Tom Holland")]),
    
    Movie(movieTitle: "Spiderman : No Way Home", movieImage: UIImage(named:"movie1")!, ratingTitle: "9.5/10 IMDb", genres: [Genres.horror,Genres.mystery,Genres.thriller], movieTime: "2h 13m", videoId: "KusPPRI8ubg", language: "English", rating: "PC-14", description: "Konu", casts: [Cast(castImage: UIImage(named:"movie1")!, castName: "Tom Holland")]),
    
]

var popularMovies : [Movie] = [
    Movie(movieTitle: "Venom Let There Be Carnage", movieImage: UIImage(named:"movie4")!, ratingTitle: "6.4/10 IMDb", genres: [Genres.horror,Genres.mystery,Genres.thriller], movieTime: "1h 47m",videoId: "KusPPRI8ubg",language: "Turkish", rating: "PC-23", description: "Konusu",casts: [Cast(castImage: UIImage(named:"movie1")!, castName: "Tom Holland")]),
    
    Movie(movieTitle: "The King's Man", movieImage: UIImage(named:"movie5")!, ratingTitle: "8.4/10 IMDb", genres: [Genres.action,Genres.fantasy], movieTime: "2h 13m",videoId: "KusPPRI8ubg", language: "Turkish", rating: "PC-23", description: "Konusu",casts: [Cast(castImage: UIImage(named:"movie1")!, castName: "Tom Holland")]),
    
    Movie(movieTitle: "Avatar : The Way Of Water", movieImage: UIImage(named:"movie7")!, ratingTitle: "9.4/10 IMDb", genres: [Genres.scienceFiction,Genres.action,Genres.adventure], movieTime: "2h 55m", videoId: "KusPPRI8ubg",language: "Turkish", rating: "PC-23", description: "Konusu",casts: [Cast(castImage: UIImage(named:"movie1")!, castName: "Tom Holland")]),
    
    Movie(movieTitle: "Pulp Fiction", movieImage: UIImage(named:"movie6")!, ratingTitle: "9.2/10 IMDb", genres: [Genres.thriller,Genres.crime], movieTime: "3h 18m",videoId: "KusPPRI8ubg",language: "Turkish", rating: "PC-23", description: "Konusu",casts: [Cast(castImage: UIImage(named:"movie1")!, castName: "Tom Holland")])
]

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didTapMenuButton()
}

class HomeViewController: UIViewController, PopularTableViewCellDelegate {
    
    weak var delegate: HomeViewControllerDelegate?
    @IBOutlet weak var nowPlayingLabel: UILabel!
    @IBOutlet weak var popularLabel: UILabel!
    @IBOutlet weak var nowShowingCollectionView: UICollectionView!
    @IBOutlet weak var popularTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie App"
        
        initUI()
        setupCollectionView()
        setupTableView()
    }
    

    
    private func initUI(){
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.primaryBlue]
        navigationController?.navigationBar.tintColor = .primaryBlue
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Icons.sideMenuIcon.image,
                                                           style: UIBarButtonItem.Style.done,
                                                           target: self,
                                                           action: #selector(didTapMenuButton))
        
        nowPlayingLabel.textColor = .primaryBlue
        popularLabel.textColor = .primaryBlue
        

    }
    
    @objc func didTapMenuButton(){
        delegate?.didTapMenuButton()
    }
    
    private func setupCollectionView() {
        nowShowingCollectionView.delegate = self
        nowShowingCollectionView.dataSource = self
        nowShowingCollectionView.showsHorizontalScrollIndicator = false
        nowShowingCollectionView.register(NowShowingCollectionViewCell.self, forCellWithReuseIdentifier: NowShowingCollectionViewCell.identifier)
//        nowShowingCollectionView.backgroundColor = .systemRed
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/2.6, height: view.frame.size.height/2.5)
        nowShowingCollectionView.collectionViewLayout = layout
    }
    
    private func setupTableView() {
        popularTableView.dataSource = self
        popularTableView.delegate = self
        popularTableView.showsVerticalScrollIndicator = false
        popularTableView.register(PopularTableViewCell.nib, forCellReuseIdentifier: PopularTableViewCell.identifier)
        popularTableView.backgroundColor = .systemRed
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }

}



extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nowShowingMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NowShowingCollectionViewCell.identifier, for: indexPath) as? NowShowingCollectionViewCell else {
            fatalError()
        }
        cell.cellItem = nowShowingMovies[indexPath.row]
//        print(cell.cellItem.movieTitle)
    
        cell.setupItems()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MovieDetailViewController()
        if let cell = collectionView.cellForItem(at: indexPath) as? NowShowingCollectionViewCell {
            if cell.isSelected {
                vc.selectedMovie = cell.cellItem
            }
        }
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularTableViewCell.identifier, for: indexPath) as? PopularTableViewCell else {
            fatalError()
        }
        cell.delegate = self
        cell.cellItem = popularMovies[indexPath.row]
        let backgroundColorView = UIView()
        backgroundColorView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundColorView
        
        print("cansu",cell.cellItem.movieTitle)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

