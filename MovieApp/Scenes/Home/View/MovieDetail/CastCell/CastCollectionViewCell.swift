//
//  CastCollectionViewCell.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/18/22.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {
    

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
    
    func configure(text: String, image: String) {
        castNameLabel.text = text
        if image.contains("original//") {
            print("foto var")
            castImageView.sd_setImage(with: URL(string: image))
        } else {
            print("foto yok")
            castImageView.image = UIImage(named: "anonymous-person-icon")
        }
        
        print("ayayay",image)
        print("cast name canım",castNameLabel.text)
    }

//    func setupItems() {
//        self.castNameLabel.text = cellItem.castName
//        self.castImageView.image = cellItem.castImage
//        
//    }
   
    
}
