//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/16/22.
//

import UIKit
import YoutubePlayer_in_WKWebView

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
        editSize()
      
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
        
    }
    
    @objc private func backButtonTapped(_ sender: UIButton) {
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.popToRootViewController(animated: true)
        
    }

    private func setupCollectionView() {
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
        castCollectionView.showsHorizontalScrollIndicator = false
        castCollectionView.backgroundColor = .green
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
    
    private func editSize () {
        if screenHeight > 600 && screenHeight < 800 {
            
            print("cansu 700den buyuk")
        }
        if screenHeight > 800 && screenHeight < 900  {
            
            print(screenHeight)
            print("800den buyuk")
        }
        if screenHeight > 900 {
            
            print(screenHeight)
            print("900den buyuk")
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
