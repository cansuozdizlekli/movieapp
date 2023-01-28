//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 1/17/23.
//

import Foundation

class HomeViewModel {
    let manager = HomeManager.shared
    var movieItems = [MovieResult]()
    var movie : Movie?
    var errorCallback : ((String)->())?
    var successCallback : (()->())?
    
    var movieCategory: MovieCategory = .popular
    
    func getCategoryItems(){
        manager.getCategoryMovies(type: movieCategory, page: (movie?.page ?? 0) + 1) { [weak self] movie, error in
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.movie = movie
                if let movieItems = movie?.results, !movieItems.isEmpty {
                    self?.movieItems.append(contentsOf: movieItems)
                }
                self?.successCallback?()
            }
        }
    }
}
