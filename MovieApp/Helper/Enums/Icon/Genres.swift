//
//  Genres.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/11/22.
//

import Foundation
import UIKit

enum Genres : CaseIterable {
    
    case action
    case adventure
    case animation
    case comedy
    case crime
    case documentary
    case drama
    case family
    case fantasy
    case history
    case horror
    case music
    case mystery
    case romance
    case scienceFiction
    case thriller
    case tvMovie
    case war
    case western

}

extension Genres {
    var title : String {
        switch self {
        case .action:
            return "ACTION"
        case .adventure:
            return "ADVANTURE"
        case .animation:
            return "ANIMATION"
        case .comedy:
            return "COMEDY"
        case .crime:
            return "CRIME"
        case .documentary:
            return "DOCUMENTARY"
        case .drama:
            return "DRAMA"
        case .family:
            return "FAMILY"
        case .fantasy:
            return "FANTASY"
        case .history:
            return "HISTORY"
        case .horror:
            return "HORROR"
        case .music:
            return "MUSİC"
        case .mystery:
            return "MYSTERY"
        case .romance:
            return "ROMANCE"
        case .scienceFiction:
            return "SCIENCE FICTION"
        case .thriller:
            return "THRILLER"
        case .tvMovie:
            return "TV MOVIE"
        case .war:
            return "WAR"
        case .western:
            return "WESTERN"
        }
    }
}
