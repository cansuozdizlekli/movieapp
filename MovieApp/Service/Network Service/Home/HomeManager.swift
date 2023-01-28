//
//  HomeManager.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 1/17/23.
//

import Foundation

protocol HomeManagerProtocol {
    func getGenres(complete: @escaping(([GenreElement]?, Error?)->()))
    func getCategoryMovies(type: MovieCategory, page: Int, complete: @escaping((Movie?, Error?)->()))
}

class HomeManager : HomeManagerProtocol {
    static let shared = HomeManager()
    
    func getGenres(complete: @escaping (([GenreElement]?, Error?) -> ())) {
        NetworkManager.shared.request(type: Genre.self,
                                      url: HomeEndpoint.genre.path,
                                      method: .get) { response in
            switch response {
            case .success(let data):
                complete(data.genres, nil)
            case .failure(let error):
                complete(nil, error)
            }
        }
    }
    
    func getCategoryMovies(type: MovieCategory, page: Int, complete: @escaping ((Movie?, Error?) -> ())) {
        var url = ""
        switch type {
        case .nowPlaying:
            url = HomeEndpoint.nowPlaying.path
        case .popular:
            url = HomeEndpoint.popular.path
        case .trending:
            url = HomeEndpoint.trending.path
        case .topRated:
            url = HomeEndpoint.topRated.path
        case .upcoming:
            url = HomeEndpoint.upcoming.path
        }
        NetworkManager.shared.request(type: Movie.self,
                                      url: url + "&page=\(page)",
                                      method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error)
            }
        }
    }
    
    
}
