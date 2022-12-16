//
//  MovieModel.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/11/22.
//

import Foundation
import UIKit

protocol Movie{
//    var genre: String { get }
    var movieImage: UIImage { get }
    var movieTitle: String { get }
    var ratingTitle : String { get }
    var genres : [Genres] { get }
    var movieTime : String { get }
    var videoId : String { get }
}

extension Movie {

    static func parseVehicleFields(jsonDict: [String:Any]) -> (String, String) {
        let model = jsonDict["model"] as! String
        let color = jsonDict["color"] as! String
        return (model, color)
    }
}
