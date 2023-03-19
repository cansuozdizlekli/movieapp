//
//  UIViewController+Ext.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 3/19/23.
//

import Foundation
import UIKit


extension UIViewController {
    
    func presentVC(to vc: UIViewController, transitionStyle: UIModalTransitionStyle = .coverVertical, presentationStyle: UIModalPresentationStyle = .fullScreen) {
        vc.modalPresentationStyle = presentationStyle
        vc.modalTransitionStyle = transitionStyle
        self.present(vc, animated: true)
    }
}
