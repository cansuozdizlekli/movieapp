//
//  GenreViewModel.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 3/14/23.
//

import Foundation

class GenreViewModel {
    
    let manager = HomeManager.shared
    var errorCallback : ((String)->())?
    var successCallback : (()->())?
    var genreItems = [GenreElement]()
    var genreNameList = [String]()
    var genreIdList = [Int]()
    
    func getGenreItems() {
        manager.getGenres { [weak self] items, error in
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.genreItems = items ?? []
                GenreHandler.shared.setItems(items: items ?? [])
                self?.genreNameList = GenreHandler.shared.getAllGenreTitles(items: self?.genreItems ?? [])
                self?.genreIdList = GenreHandler.shared.getAllGenreIds(items: self?.genreItems ?? [])
                print("cemos",self?.genreIdList)
                self?.successCallback?()
            }
        }
    }
}
