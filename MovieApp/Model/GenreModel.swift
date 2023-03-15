//
//  GenreModel.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 1/17/23.
//

import Foundation

struct Genre: Codable {
    let genres: [GenreElement]?
}

// MARK: - GenreElement
struct GenreElement: Codable {
    let id: Int?
    let name: String?
}

class GenreHandler {
    static let shared = GenreHandler()
    
    private var items = [GenreElement]()
    
    func setItems(items: [GenreElement]) {
        self.items = items
        print(items)
    }
    
    func getItemTitles(ids: [Int]) -> [String] {
        var titles = [String]()
        let elements = items.filter({ ids.contains($0.id ?? 0) })
        for element in elements {
            titles.append(element.name ?? "")
        }
        return titles
    }
    
    func getAllGenreTitles(items: [GenreElement] ) -> [String] {
        var titles = [String]()
        self.items = items
        for element in items {
            print("elementsss",element.name)
            titles.append(element.name ?? "")
        }
        return titles
    }
    
    
}
