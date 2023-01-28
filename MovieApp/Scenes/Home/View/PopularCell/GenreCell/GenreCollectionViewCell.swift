//
//  GenreCollectionViewCell.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 1/28/23.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }


}
