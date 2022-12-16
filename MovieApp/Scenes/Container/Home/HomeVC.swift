//
//  HomeVC.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/10/22.
//

import UIKit

protocol HomeVCDelegate: AnyObject {
    func didTapMenuButton()
}

class HomeVC: UIViewController {
    
    weak var delegate: HomeVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        navigationController?.navigationBar.layer.bounds.origin.y = 0
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Icons.sideMenuIcon.image,
                                                           style: UIBarButtonItem.Style.done,
                                                           target: self,
                                                           action: #selector(didTapMenuButton))

        navigationController?.navigationBar.tintColor = .primaryRed
    }
    
    @objc func didTapMenuButton(){
        delegate?.didTapMenuButton()
    }


    
}
