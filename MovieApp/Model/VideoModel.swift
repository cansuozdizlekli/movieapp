//
//  VideoModel.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 3/8/23.
//


import Foundation

// MARK: - Video
struct Video: Codable {
    let id: Int
    let results: [VideoResult]
}

// MARK: - Result
struct VideoResult: Codable {
    let iso639_1, iso3166_1, name, key: String
    let publishedAt, site: String
    let size: Int
    let type: String
    let official: Bool
    let id: String

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name, key
        case publishedAt = "published_at"
        case site, size, type, official, id
    }
}

class VideoHandler {
    static let shared = VideoHandler()
    
    private var items = [VideoResult]()
    
    func setVideoItems(items: [VideoResult]) -> [String] {
        var videoKeyArray = [String]()
        self.items = items
//        print("mırmır",items.count)
        for item in items {
            if(item.site == "YouTube") {
                if(item.type == "Trailer"){
                    videoKeyArray.append(item.key)
                    print("mırmır2",item)
                }
            }
        }
        print("mırmır2",videoKeyArray)
        return videoKeyArray
    }
}

