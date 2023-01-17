//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/16/22.
//

import UIKit
import YoutubePlayer_in_WKWebView

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var playerView: WKYTPlayerView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingTypeLabel: UILabel!
    
    @IBOutlet weak var castCollectionView: UICollectionView!
    
    var selectedMovie: Movie!
    
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
//        view.backgroundColor = .green
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        playerView.webView?.translatesAutoresizingMaskIntoConstraints = false
        playerView.load(withVideoId:selectedMovie.videoId)
        initUI()
        setupCollectionView()
        editSize()
        
      
    }
    
    private func initUI(){
        view.addSubview(backButton)
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        detailView.layer.cornerRadius = 10
        movieNameLabel.text = selectedMovie.movieTitle
        ratingLabel.text = selectedMovie.ratingTitle
        lengthLabel.text = selectedMovie.movieTime
        languageLabel.text = selectedMovie.language
        ratingTypeLabel.text = selectedMovie.rating
        descriptionLabel.text = selectedMovie.description
        
        print("turlerr:", selectedMovie.genres)
        var place = -60
        for genre in selectedMovie.genres {
            place = place + 80
                print("turler:",genre)
            let title: UILabel = {
                var label = UILabel()
                label = UILabel(frame: CGRect(x: place, y: Int(screenHeight) / 2 - 40, width: 70, height: 20))
                label.backgroundColor = .lightestBlue
                label.text = genre.title
                label.textColor = .secondaryBlue
                label.adjustsFontSizeToFitWidth = false
                label.textAlignment = .center
                label.layer.cornerRadius = 10
                label.layer.masksToBounds = true
                label.font = UIFont(name: "Mulish-Bold", size: 10)
                return label
            }()
            view.addSubview(title)
        }
        
        
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


extension MovieDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedMovie.casts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCollectionViewCell.identifier, for: indexPath) as? CastCollectionViewCell else {
            fatalError()
        }
        cell.bounds = CGRect(x: 0, y: 0, width: 80, height: 100)

        print("cell içi cemil", selectedMovie.casts[indexPath.row])
        cell.cellItem = selectedMovie.casts[indexPath.row]
       
        cell.setupItems()

        return cell
    }
    
    
    

}
