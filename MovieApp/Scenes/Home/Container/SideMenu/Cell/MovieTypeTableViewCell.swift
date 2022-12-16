//
//  MovieTypeTableViewCell.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/11/22.
//

import UIKit

class MovieTypeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieGenreLabel: UILabel!
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    weak var delegate: MovieTypeTableViewCell?
    
//    var cellItem: Movie! {
//        didSet {
//            cellItem.genre = ""
//        }
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
