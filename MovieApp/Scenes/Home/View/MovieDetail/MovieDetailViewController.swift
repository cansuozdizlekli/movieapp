//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/16/22.
//

import UIKit
import YoutubePlayer_in_WKWebView
import Firebase
import FirebaseAuth
import FirebaseStorage

class MovieDetailViewController: UIViewController {
    
    let viewModel = HomeViewModel()
    var selectedMovie: MovieResult!
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var playerView: WKYTPlayerView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingTypeLabel: UILabel!
    @IBOutlet weak var genreCollectionView: UICollectionView!
    @IBOutlet weak var castCollectionView: UICollectionView!
    
    @IBOutlet weak var favButton: UIButton!
    
    private let backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 65, width: 50, height: 50))
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "arrow.backward",withConfiguration: UIImage.SymbolConfiguration(pointSize: 17)), for: UIControl.State.normal)
        button.tintColor = .white
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.4
        button.layer.cornerRadius = 25
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        initUI()
        setupCollectionView()
        viewModelConfiguration()
        
        
      
    }
    
    private func initUI(){
        view.addSubview(backButton)
        tabBarController?.tabBar.isHidden = true
        playerView.webView?.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        detailView.layer.cornerRadius = 10
        movieNameLabel.text = selectedMovie.originalTitle
        ratingLabel.text = selectedMovie.ratingText
        lengthLabel.text = selectedMovie.releaseDate
        languageLabel.text = selectedMovie.originalLanguage
        descriptionLabel.text = selectedMovie.overview
        favButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        
    }
    
    @objc private func backButtonTapped(_ sender: UIButton) {
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.popToRootViewController(animated: true)
        
    }

    @IBAction func favButtonTapped(_ sender: Any) {
        favButton.isSelected.toggle()
        if favButton.isSelected {
            let db = Firestore.firestore()
            let user = Auth.auth().currentUser
            if let user = user {
                print("userım",user.email!)
                db.collection("Favourite Movie List").document("Emails").collection(user.email!).document(selectedMovie.titleText).setData([
                                                                                      "adult" : selectedMovie.adult!,
                                                                                      "backdropPath" : selectedMovie.backdropPath!,
                                                                                      "genreIDS" : selectedMovie.genreIDS!,
                                                                                      "id" : selectedMovie.id!,
                                                                                      "originalLanguage" : selectedMovie.originalLanguage!,
                                                                                      "originalTitle" : selectedMovie.originalTitle!,
                                                                                      "overview" : selectedMovie.overview!,
                                                                                      "popularity" : selectedMovie.popularity!,
                                                                                      "posterPath" : selectedMovie.posterPath!,
                                                                                      "releaseDate" : selectedMovie.releaseDate!,
                                                                                      "title" : selectedMovie.title!,
                                                                                      "video" : selectedMovie.video!,
                                                                                      "voteAverage" : selectedMovie.voteAverage!,
                                                                                      "voteCount" : selectedMovie.voteCount!,
//                                                                                      "character" : selectedMovie.character!
                                                                                      "creditID" : selectedMovie.creditID as Any,
//                                                                                      "order" : selectedMovie.order as Any,
//                                                                                      "department" : selectedMovie.department,
//                                                                                      "job" : selectedMovie.job!,
                                                                                      "posterImage" : selectedMovie.posterImage,
                                                                                      "ratingText" : selectedMovie.ratingText,
                                                                                      "genreItems" : selectedMovie.genreItems,
                                                                                      "overViewText" : selectedMovie.overViewText,
                                                                                      "UserID": user.email!], merge: true)
                
                           
            }
        }
    }
    
    private func setupCollectionView() {
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
        castCollectionView.showsHorizontalScrollIndicator = false
//        castCollectionView.backgroundColor = .green
        castCollectionView.register(CastCollectionViewCell.nib, forCellWithReuseIdentifier: CastCollectionViewCell.identifier)
        
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
        genreCollectionView.register(GenreCollectionViewCell.nib, forCellWithReuseIdentifier: GenreCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 70, height: 30)
        genreCollectionView.collectionViewLayout = layout
        genreCollectionView.reloadData()
       
    }
    
    private func viewModelConfiguration(){
        viewModel.getCastItems(movieID: self.selectedMovie.id!)
        viewModel.getVideoItems(movieID: self.selectedMovie.id!)
        
        viewModel.errorCallback = { errorMessage in
            print("error",errorMessage)
        }
        viewModel.successCallback = { [weak self] in
            if let videoKey = self?.viewModel.videoLinkArray.last {
                self?.playerView.load(withVideoId: videoKey)
                print("balbalbal",videoKey)
            }
                           
            self?.castCollectionView.reloadData()
        }
    }
    
    
    
    
    

}


extension MovieDetailViewController: UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == self.castCollectionView) {
            return viewModel.castItems.count
        } else {
            return selectedMovie.genreItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == self.castCollectionView) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCollectionViewCell.identifier, for: indexPath) as? CastCollectionViewCell else {
                fatalError()
            }
            cell.bounds = CGRect(x: 0, y: 0, width: 80, height: 110)
            cell.configure(text: viewModel.castItems[indexPath.row].name,image:
                            viewModel.castItems[indexPath.row].castImage)
            print("ay bu ne ya",viewModel.castItems[indexPath.row].name)
            
            return cell
        } else {
            guard let cell = genreCollectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.identifier, for: indexPath) as? GenreCollectionViewCell else {
                fatalError()
            }
            cell.configure(text: selectedMovie.genreItems[indexPath.item].uppercased())
            
            return cell
        }
        
    
    }
    

}
