//
//  MovieModel.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/11/22.
//

import Foundation
import UIKit

struct Movie{
//    var genre: String { get }
    var movieTitle: String
    var movieImage: UIImage
    var ratingTitle : String
    var genres : [Genres]
    var movieTime : String
    var videoId : String
    var language : String
    var rating : String
    var description : String
    var casts : [Cast]
}

struct Cast {
    var castImage : UIImage
    var castName : String
}


