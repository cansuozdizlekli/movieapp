//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/16/22.
//

import UIKit
import YoutubePlayer_in_WKWebView

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var playerView: WKYTPlayerView!
    
    var selectedMovie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
//        playerView.webView?.translatesAutoresizingMaskIntoConstraints = false
//        playerView.load(withVideoId:selectedMovie.videoId)
        
        
      
    }


   

}
