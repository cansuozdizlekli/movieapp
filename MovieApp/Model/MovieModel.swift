//
//  MovieModel.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/11/22.
//

import Foundation
import UIKit

//struct Movie {
////    var genre: String { get }
//    var movieTitle: String
//    var movieImage: UIImage
//    var ratingTitle : String
//    var genres : [Genres]
//    var movieTime : String
//    var videoId : String
//    var language : String
//    var rating : String
//    var description : String
//    var casts : [Cast]
//}
//
//struct Cast {
//    var castImage : UIImage
//    var castName : String
//}


struct Movie: Codable {
    let page: Int?
    let results: [MovieResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieResult: Codable, MovieCellProtocol {
    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let character, creditID: String?
    let order: Int?
    let department, job: String?
    
    var posterImage: String {
        NetworkHelper.shared.getImagePath(url: posterPath ?? "")
    }
    
    var titleText: String {
        title ?? ""
    }
    
    var ratingText: String {
        if let voteAverage = voteAverage {
            return "\(String(format: "%.1f", voteAverage)) / 10 IMDB"
        }
        return ""
    }
    
    var genreItems: [String] {
        GenreHandler.shared.getItemTitles(ids: genreIDS ?? [])
    }
    
    var overViewText: String {
        overview ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
}

