//
//  NetworkHelper.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 1/17/23.
//

import Foundation

enum ErrorTypes: String, Error {
    case invalidData = "Invalid data"
    case invalidURL = "Invalid url"
    case generalError = "An error happened"
}

class NetworkHelper {
    static let shared = NetworkHelper()
        
    private let baseURL = "https://api.themoviedb.org/3/"
    private let apiKey = "76b0e8454bbbcbeef094c7e4fc5ece8e"
    private let imageBasePath = "https://image.tmdb.org/t/p/original/"
    
    func requestUrl(url: String) -> String {
        return baseURL + url + "?api_key=\(apiKey)"
    }
    
    func requestCastUrl(url: String) -> String {
        return baseURL + url + "/credits?api_key=\(apiKey)"
    }
    
    
    func getImagePath(url: String) -> String {
        return imageBasePath + url
    }
}
