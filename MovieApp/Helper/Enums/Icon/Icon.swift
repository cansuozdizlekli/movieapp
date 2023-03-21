//
//  Icon.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/10/22.
//

import UIKit


import Foundation
import UIKit

enum Icons{
    case tabBarHome
    case tabBarHomeFill
    case tabBarFavorite
    case tabBarFavoriteFill
    case tabBarSettings
    case tabBarSettingsFill
    case sideMenuIcon
    case logOutButton
    case normalHeart
    case filledHeart
    
    var image: UIImage {
        switch self {
        case .tabBarHome:
            return UIImage(systemName: "house") ?? UIImage()
        case .tabBarHomeFill:
            return UIImage(systemName: "house.fill") ?? UIImage()
        case .tabBarFavorite:
            return UIImage(systemName: "heart") ?? UIImage()
        case .tabBarFavoriteFill:
            return UIImage(systemName: "heart.fill") ?? UIImage()
        case .tabBarSettings:
            return UIImage(systemName: "gearshape") ?? UIImage()
        case .tabBarSettingsFill:
            return UIImage(systemName: "gearshape.fill") ?? UIImage()
        case .sideMenuIcon:
            return UIImage(systemName: "list.bullet") ?? UIImage()
        case .logOutButton:
            return UIImage(systemName: "arrow.left.to.line") ?? UIImage()
        case .normalHeart:
            return UIImage(systemName: "heart") ?? UIImage()
        case .filledHeart:
            return UIImage(systemName: "heart.fill") ?? UIImage()
        }
    }
}
