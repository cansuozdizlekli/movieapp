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
    func getCasts(movieId: Int, complete: @escaping(([CastElement]?, Error?)->()))
}

class HomeManager : HomeManagerProtocol {
    func getCasts(movieId: Int, complete: @escaping (([CastElement]?, Error?) -> ())) {
        var castUrl = HomeEndpoint.cast.path
        let replaced = castUrl.replacingOccurrences(of: "e//", with: "e/\(String(movieId))/")
        print("neyi cekiom",replaced)
        NetworkManager.shared.request(type: Cast.self,
                                      url: replaced ,
                                      method: .get) { response in
            switch response {
            case .success(let data):
                print("url ",data)
                complete(data.cast, nil)
            case .failure(let error):
                complete(nil, error)
            }
        }
    }
    
    
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
    
    func getVideos(movieId: Int, complete: @escaping (([CastElement]?, Error?) -> ())) {
        var castUrl = HomeEndpoint.cast.path
        let replaced = castUrl.replacingOccurrences(of: "e//", with: "e/\(String(movieId))/")
        print("neyi cekiom",replaced)
        NetworkManager.shared.request(type: Cast.self,
                                      url: replaced ,
                                      method: .get) { response in
            switch response {
            case .success(let data):
                print("url ",data)
                complete(data.cast, nil)
            case .failure(let error):
                complete(nil, error)
            }
        }
    }
    
   
    
}
