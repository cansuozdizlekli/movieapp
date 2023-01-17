//
//  CastCollectionViewCell.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/18/22.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {
    
    var cellItem : Cast!

    @IBOutlet weak var castImageView: UIImageView!
    @IBOutlet weak var castNameLabel: UILabel!
    
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
       
    }

    func setupItems() {
        self.castNameLabel.text = cellItem.castName
        self.castImageView.image = cellItem.castImage
        
    }
   
    
}
