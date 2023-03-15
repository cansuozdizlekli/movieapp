//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/11/22.
//

import UIKit


protocol HomeViewControllerDelegate: AnyObject {
    func didTapMenuButton()
}

class HomeViewController: UIViewController, PopularTableViewCellDelegate {
    
    let viewModel = HomeViewModel()
    var chosenGenre : String = ""
    weak var delegate: HomeViewControllerDelegate?
    @IBOutlet weak var nowPlayingLabel: UILabel!
    @IBOutlet weak var popularLabel: UILabel!
    @IBOutlet weak var nowShowingCollectionView: UICollectionView!
    @IBOutlet weak var popularTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie App"
        initUI()
        setupCollectionView()
        viewModelConfiguration()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        
    }
    
    private func viewModelConfiguration(){
        viewModel.getNowPlayingItems(MovieFilterType: .nowPlaying)
        viewModel.getCategoryItems(MovieFilterType: .topRated)
        viewModel.getSelectedGenreItems(Genre: 16)
        viewModel.getGenreItems()
        viewModel.errorCallback = { [weak self] errorMessage in
            print("error",errorMessage)
        }
        viewModel.successCallback = { [weak self] in
            self?.nowShowingCollectionView.reloadData()
            self?.popularTableView.reloadData()
        }
        
    }

    
    private func initUI(){
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.primaryBlue]
        navigationController?.navigationBar.tintColor = .primaryBlue
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Icons.sideMenuIcon.image,
                                                           style: UIBarButtonItem.Style.done,
                                                           target: self,
                                                           action: #selector(didTapMenuButton))
        
        nowPlayingLabel.textColor = .primaryBlue
        popularLabel.textColor = .primaryBlue
        
    }
    
    @objc func didTapMenuButton(){
        delegate?.didTapMenuButton()
        self.popularTableView.reloadData()
    }
    
    private func setupCollectionView() {
        nowShowingCollectionView.delegate = self
        nowShowingCollectionView.dataSource = self
        nowShowingCollectionView.showsHorizontalScrollIndicator = false
        nowShowingCollectionView.register(NowShowingCollectionViewCell.self, forCellWithReuseIdentifier: NowShowingCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/2.25, height: view.frame.size.height/2.6)
        nowShowingCollectionView.collectionViewLayout = layout
    }

    private func setupTableView() {
        popularTableView.dataSource = self
        popularTableView.delegate = self
        popularTableView.showsVerticalScrollIndicator = false
        popularTableView.register(PopularTableViewCell.nib, forCellReuseIdentifier: PopularTableViewCell.identifier)
        popularTableView.backgroundColor = .systemRed
    }
    


}



extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.nowPlayingMovieItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NowShowingCollectionViewCell.identifier, for: indexPath) as? NowShowingCollectionViewCell else {
            fatalError()
        }
        cell.cellItem = viewModel.nowPlayingMovieItems[indexPath.row]
        print("cansu1",cell.cellItem.originalTitle)

        cell.setupItems()

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MovieDetailViewController()
        if let cell = collectionView.cellForItem(at: indexPath) as? NowShowingCollectionViewCell {
            if cell.isSelected {
                vc.selectedMovie = cell.cellItem
            }
        }
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        navigationController?.pushViewController(vc, animated: true)
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularTableViewCell.identifier, for: indexPath) as? PopularTableViewCell else {
            fatalError()
        }
        cell.delegate = self
        print("genre secili mş",chosenGenre)
        if (chosenGenre != ""){
            for genre in viewModel.movieItems[indexPath.row].genreItems {
                if (genre.uppercased() == chosenGenre) {
                    cell.cellItem = viewModel.movieItems[indexPath.row]
                    return cell
                }else{
                    
                }
            }
        }else {
            cell.cellItem = viewModel.movieItems[indexPath.row]
            return cell
        }
        
//        let backgroundColorView = UIView()
//        backgroundColorView.backgroundColor = UIColor.clear
//        cell.selectedBackgroundView = backgroundColorView

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieDetailViewController()
        if let cell = tableView.cellForRow(at: indexPath) as? PopularTableViewCell {
            if cell.isSelected {
                vc.selectedMovie = cell.cellItem
            }
        }
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }


}

