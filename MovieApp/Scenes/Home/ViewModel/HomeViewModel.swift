//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 1/17/23.
//

import Foundation

class HomeViewModel {
    let manager = HomeManager.shared
    var nowPlayingMovieItems = [MovieResult]()
    var movieItems = [MovieResult]()
    var genreItems = [GenreElement]()
    var castItems = [CastElement]()
    var videoItems = [VideoResult]()
    var castNameArray = [String]()
    var videoLinkArray = [String]()
    var movie : Movie?
    var errorCallback : ((String)->())?
    var successCallback : (()->())?
    
    
    
    var movieId: Int = 12
    
    func getNowPlayingItems(MovieFilterType: MovieCategory){
        manager.getCategoryMovies(type: MovieFilterType, page: (movie?.page ?? 0) + 1) { [weak self] movie, error in
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.movie = movie
                if let nowPlayingMovieItems = movie?.results, !nowPlayingMovieItems.isEmpty {
                    self?.nowPlayingMovieItems.append(contentsOf: nowPlayingMovieItems)
                }
                self?.successCallback?()
            }
        }
    }
    
    func getCategoryItems(MovieFilterType: MovieCategory){
        manager.getCategoryMovies(type: MovieFilterType, page: (movie?.page ?? 0) + 1) { [weak self] movie, error in
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
                self?.getCategoryItems(MovieFilterType: .popular)
            }
        }
    }
    
    func getCastItems(movieID: Int){
        manager.getCasts(movieId: movieID) { [weak self] items, error in
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.castItems = items ?? []
                self?.castNameArray = CastHandler.shared.setItems(items: items ?? [])
//                print("balbal",castNameArray)
                self?.successCallback?()
            }
        }
    }
    
    func getVideoItems(movieID: Int){
        manager.getVideos(movieId: movieID) { [weak self] items, error in
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.videoItems = items ?? []
                self?.videoLinkArray = VideoHandler.shared.setVideoItems(items: items ?? [])
                print("balbal",movieID)
                self?.successCallback?()
            }
        }
    }
    
    
    
}
