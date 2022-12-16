//
//  ContainerVC.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/10/22.
//

import UIKit

class ContainerVC: UIViewController {
    
    enum MenuState {
        case opened
        case closed
    }
    
    private var menuState: MenuState = .closed
    
    let menuVC = SideMenuVC()
    let homeVC = HomeViewController()
    var navVC: UINavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemBlue
        view.backgroundColor = .white
        addChildVCs()
    }
    
    private func addChildVCs(){
        // MENU
        
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

extension ContainerVC : HomeViewControllerDelegate {
    func didTapMenuButton() {
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
                    self?.menuState = .closed
                }
            }
        
        }
    }
}
