//
//  PopularTableViewCell.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/13/22.
//

import UIKit

protocol PopularTableViewCellDelegate : AnyObject{

}

class PopularTableViewCell: UITableViewCell {
    
//    var cellItem: PopularMovie!
    
    var cellItem: PopularMovie! {
        didSet {
            self.movieImageView.image = cellItem?.movieImage
            self.movieTitleLabel.text = cellItem?.movieTitle
            self.ratingLabel.text = cellItem?.ratingTitle
            self.timeLabel.text = cellItem?.movieTime
            var place = 35
            for genre in cellItem.genres {
                place = place + 80
//                print("turler:",genre.title)
                let title: UILabel = {
                    var label = UILabel()
                    label = UILabel(frame: CGRect(x: place, y: 80, width: 70, height: 20))
                    label.backgroundColor = .lightestBlue
                    label.text = genre.title
                    label.textColor = .secondaryBlue
                    label.adjustsFontSizeToFitWidth = false
                    label.textAlignment = .center
                    label.layer.cornerRadius = 10
                    label.layer.masksToBounds = true
                    label.font = UIFont(name: "Mulish-Bold", size: 10)
                    return label
                }()
                contentView.addSubview(title)
            }
//            print("kac film turler:\n",cellItem.genres.count)
        }
    }
    
    weak var delegate: PopularTableViewCellDelegate?


    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
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

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        movieImageView.layer.cornerRadius = 5
        
       
    }
    

    
}
