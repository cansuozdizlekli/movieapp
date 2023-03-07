//
//  HomeHelper.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 1/17/23.
//

import Foundation

enum MovieCategory {
    case nowPlaying
    case popular
    case trending
    case topRated
    case upcoming
}

enum HomeEndpoint: String {
    case genre = "genre/movie/list"
    case popular = "movie/popular"
    case nowPlaying = "movie/now_playing"
    case trending = "trending/movie/day"
    case topRated = "movie/top_rated"
    case upcoming = "movie/upcoming"
    case cast = "movie/"

    var path: String {
        switch self {
        case .genre:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.genre.rawValue)
        case .popular:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.popular.rawValue)
        case .nowPlaying:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.nowPlaying.rawValue)
        case .trending:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.trending.rawValue)
        case .topRated:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.topRated.rawValue)
        case .upcoming:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.upcoming.rawValue)
        case .cast:
            return NetworkHelper.shared.requestCastUrl(url: HomeEndpoint.cast.rawValue)
        }
    }
}
