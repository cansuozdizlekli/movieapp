//
//  SideMenuVC.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/10/22.
//

import UIKit

protocol SideMenuVCDelegate: AnyObject {
    func didTapMenuButton()
}

class SideMenuVC: UIViewController {

    var chosenGenre = ""
    
    weak var delegate: SideMenuVCDelegate?
    let viewModel = GenreViewModel()
    var genreNames = [String]()
    var movies = [Movie]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        viewModelConfiguration()
        setupTableView()
        
    }
    
    private func setUpUI(){
        view.backgroundColor = .systemGray
        view.frame.size.height = screenHeight
//        (tabBarController?.tabBar.frame.height)!
        view.frame.size.width = screenWidth - 133
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner]
    }
    
    private func setupTableView() {
        tableView.register(MovieTypeTableViewCell.nib, forCellReuseIdentifier: MovieTypeTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc func didTapMenuButton(){
        didTapMenuButton()
    }
    
    private func viewModelConfiguration(){
        viewModel.getGenreItems()
        viewModel.errorCallback = { [weak self] errorMessage in
            print("error",errorMessage)
        }
        viewModel.successCallback = { [weak self] in
//            print("kac tur varmıss",self?.viewModel.genreNameList.count)
            self?.genreNames = self?.viewModel.genreNameList ?? []
            self?.tableView.reloadData()
        }
        
    }
}

extension SideMenuVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("kac tur varmıss table view ici",genreNames.count)
        return genreNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTypeTableViewCell.identifier, for: indexPath) as? MovieTypeTableViewCell else {
            fatalError()
        }
        
        let genreItem = genreNames[indexPath.row]
        cell.movieGenreLabel.text = genreItem.uppercased()
        
        let backgroundColorView = UIView()
        backgroundColorView.backgroundColor = UIColor.lightestBlue
        cell.selectedBackgroundView = backgroundColorView
        self.tableView.showsVerticalScrollIndicator = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? MovieTypeTableViewCell {
            print("hangi tür gösterilcek",cell.movieGenreLabel.text!)
            let vc = ContainerVC()
            chosenGenre = cell.movieGenreLabel.text!
            vc.isGenreSelected = true
            vc.SelectedGenre = cell.movieGenreLabel.text!
            print("isgenrem",vc.SelectedGenre)
            delegate?.didTapMenuButton()
            
        }
        
    }
    
    
}
