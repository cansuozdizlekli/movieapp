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

    var chosenGenreId : Int = 0
    var chosenGenreName : String = ""
    weak var delegate: SideMenuVCDelegate?
    
    let viewModel = GenreViewModel()
    var genreNames = [String]()
    var genreIds = [Int]()
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
            self?.genreNames = self?.viewModel.genreNameList ?? []
            self?.genreIds = self?.viewModel.genreIdList ?? []
            self?.tableView.reloadData()
        }
        
    }
}

extension SideMenuVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
            
            let vc = ContainerVC()
            chosenGenreId = genreIds[indexPath.row].self
            chosenGenreName = genreNames[indexPath.row].self
            vc.isGenreSelected = true
            vc.SelectedGenreId = genreIds[indexPath.row].self
            vc.SelectedGenreName = genreNames[indexPath.row].self
            print("hangi tür gösterilcek",vc.SelectedGenreName)
//            delegate?.didTapMenuButton()
        }
        
    }
    
    
}
