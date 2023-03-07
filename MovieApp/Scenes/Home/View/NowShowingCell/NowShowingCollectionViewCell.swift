//
//  NowShowingCollectionViewCell.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/12/22.
//

import UIKit

class NowShowingCollectionViewCell: UICollectionViewCell {
    
    var cellItem: MovieResult!

    private let movieImage: UIImageView = {
        let movieImage = UIImageView(frame: CGRect(x: 0, y: 15, width: 160, height: 250))
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieImage.contentMode = .scaleAspectFill
        movieImage.layer.cornerRadius = 5
        movieImage.layer.masksToBounds = true
        return movieImage
    }()
    
    private var movieTitle: UILabel = {
        var label = UILabel()
        label = UILabel(frame: CGRect(x: 0, y: 270, width: 180, height: 40))
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = false
        label.textAlignment = .left
//        label.backgroundColor = .systemRed
        label.font = UIFont(name: "Mulish-Bold", size: 15)
        return label
    }()
    
    private var ratingTitle: UILabel = {
        var label = UILabel()
        label = UILabel(frame: CGRect(x: 17, y: 270, width: 160, height: 100))
        label.numberOfLines = 1
        label.textColor = .textGray
        label.adjustsFontSizeToFitWidth = false
        label.textAlignment = .left
        label.font = UIFont(name: "Mulish-Regular", size: 12)

        return label
    }()
    
    private let starImage: UIImageView = {
        let starImage = UIImageView(frame: CGRect(x: 0, y: 310.5, width: 12, height: 12))
        starImage.translatesAutoresizingMaskIntoConstraints = false
        starImage.contentMode = .scaleAspectFill
        starImage.image = UIImage(named: "star")
        return starImage
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(movieImage)
        contentView.addSubview(movieTitle)
        contentView.addSubview(ratingTitle)
        contentView.addSubview(starImage)
        contentView.clipsToBounds = true
        contentView.frame = CGRect(x: 0, y: 0, width: 180, height: 200)
//        contentView.backgroundColor = .systemMint
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class var identifier: String {
        return String(describing: self)
    }
    
    
    func configure(image : UIImage?){
        movieImage.image = image
    }
    
    func setupItems() {
        self.movieTitle.text = cellItem.originalTitle
        self.movieImage.sd_setImage(with: URL(string: cellItem.posterImage))
//        self.movieImage.image = cellItem.movieImage
        self.ratingTitle.text = "\(String(format: "%.1f", cellItem.voteAverage!)) / 10 IMDB"
        
    }
   
}
