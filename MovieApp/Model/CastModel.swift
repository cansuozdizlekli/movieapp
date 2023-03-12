//
//  CastModel.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 3/6/23.
//


import Foundation
import UIKit

// MARK: - Cast
struct Cast: Codable {
    let id: Int
    let cast, crew: [CastElement]
}

// MARK: - CastElement
struct CastElement: Codable {
    let adult: Bool
    let gender, id: Int
    let knownForDepartment, name, originalName: String
    let popularity: Double
    let profilePath: String?
    let castID: Int?
    let character: String?
    let creditID: String
    let order: Int?
    let department, job: String?
    
    
    var castImage: String {
        NetworkHelper.shared.getImagePath(url: profilePath ?? "")
    }
    

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
}

class CastHandler {
    static let shared = CastHandler()
    
    private var items = [CastElement]()
    
    func setItems(items: [CastElement]) -> [String] {
        var castNameArray = [String]()
        self.items = items
//        print("mırmır",items.count)
        for item in items {
//            print("mırmır2",item)
            if(item.knownForDepartment == "Acting"){
//                print("mırmır3",item.name)
                castNameArray.append(item.name)
            }
        }
        return castNameArray
    }
}



