//
//  ContainerVC.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/10/22.
//

import UIKit

protocol ContainerVCDelegate: AnyObject {
    func reloadTableView()
}


class ContainerVC: UIViewController {
    
    enum MenuState {
        case opened
        case closed
    }
    weak var delegate: ContainerVCDelegate?
    var menuState: MenuState = .closed
    var isGenreSelected : Bool = false
    var SelectedGenreId : Int = 0
    var SelectedGenreName : String = ""
    var homeViewModel = HomeViewModel()
    let menuVC = SideMenuVC()
    let homeVC = HomeViewController()
    var navVC: UINavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addChildVCs()
    }
    
    private func addChildVCs(){
        // MENU
        menuVC.delegate = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        
        // HOME
        homeVC.delegate = self
        let navigationVC = UINavigationController(rootViewController: homeVC)
        addChild(navigationVC)
        view.addSubview(navigationVC.view)
        navigationVC.didMove(toParent: self)
        self.navVC = navigationVC
    }
    
}

extension ContainerVC : HomeViewControllerDelegate , SideMenuVCDelegate  {
    
    func didTapMenuButton() {
        print("did tap menu button")
        self.SelectedGenreId = (self.menuVC.chosenGenreId)
        self.homeVC.chosenGenreId = (self.menuVC.chosenGenreId)
        self.homeVC.chosenGenreName = (self.menuVC.chosenGenreName)
        switch menuState {
        case .closed:
            //opened it
            tabBarController?.tabBar.isHidden = true
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0,options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 133
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .opened
                }
            }

        case .opened:
            //closed it
            tabBarController?.tabBar.isHidden = false
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0,options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = 0
            } completion: { [weak self] done in
                if done {
                    self?.SelectedGenreId = (self?.menuVC.chosenGenreId)!
                    self?.homeVC.chosenGenreId = (self?.menuVC.chosenGenreId)!
                    self?.menuState = .closed
                    if self?.SelectedGenreId != 0 {
                        print("caslıo",self?.SelectedGenreName)
                        self?.homeViewModel.getSelectedGenreItems(Genre: self?.SelectedGenreId ?? 0)
                        self?.homeVC.popularTableView.reloadData()
//                        self?.homeVC.popularLabel.text = self?.SelectedGenreName
                        
                    }
                }
            }
        
        }
    }
    
    
}
