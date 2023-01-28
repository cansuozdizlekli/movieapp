//
//  PopularTableViewCell.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/13/22.
//

import UIKit
import SDWebImage

protocol PopularTableViewCellDelegate : AnyObject{
    
}
protocol MovieCellProtocol {
    var posterImage: String { get }
    var titleText: String { get }
    var ratingText: String { get }
    var genreItems: [String] { get }
    var overViewText: String { get }
}

class PopularTableViewCell: UITableViewCell {
    
    var cellItem: MovieResult! {
        didSet {
            self.movieImageView.sd_setImage(with: URL(string: cellItem.posterImage))
            self.movieTitleLabel.text = cellItem?.originalTitle
            self.ratingLabel.text = "\(String(format: "%.1f", cellItem.voteAverage!)) / 10 IMDB"
            print("kac",cellItem.genreIDS)
            if cellItem.genreItems.isEmpty{
                print("genre gelmiyor")
            }else {
                genres = (cellItem?.genreIDS)!
            }
        }
    }
    
    var genres = [Int]()
    
    weak var delegate: PopularTableViewCellDelegate?


    @IBOutlet weak var genreCollectionView: UICollectionView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
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

    
    override func layoutSubviews() {
        super.layoutSubviews()
        movieImageView.layer.cornerRadius = 5
    }
    
    
}

extension PopularTableViewCell: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("cansu\n",genres.count)
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.identifier, for: indexPath) as? GenreCollectionViewCell else {
            fatalError()
        }
        return cell

    }
    
    
}


