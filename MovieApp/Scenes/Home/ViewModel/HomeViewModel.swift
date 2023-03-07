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
    var genreItems = [GenreElement]()
    var castItems = [CastElement]()
    var castNameArray = [String]()
    var movie : Movie?
    var errorCallback : ((String)->())?
    var successCallback : (()->())?
    
    var movieCategory: MovieCategory = .popular
    
    var movieId: Int = 12
    
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
    
    func getGenreItems() {
        manager.getGenres { [weak self] items, error in
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.genreItems = items ?? []
                GenreHandler.shared.setItems(items: items ?? [])
                self?.getCategoryItems()
            }
        }
    }
    
    func getCastItems(movieID: Int){
        
        manager.getCasts(movieId: movieID) { [weak self] items, error in
            var castNameArray = [String]()
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.castItems = items ?? []
                castNameArray = CastHandler.shared.setItems(items: items ?? [])
                print("balbal",castNameArray)
                self?.successCallback?()
            }
        }
    }
}
