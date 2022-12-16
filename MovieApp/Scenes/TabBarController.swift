//
//  TabBarController.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/10/22.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        tabBar.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        additionalSafeAreaInsets.bottom = 6
        tabBar.tintColor = .primaryBlue
        tabBar.addCornerRadius(6, [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        tabBar.addDropShadow()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let homeTab = ContainerVC()
        let homeTabItem = UITabBarItem(title: "Home",
                                       image: Icons.tabBarHome.image,
                                       selectedImage: Icons.tabBarHomeFill.image)
        homeTab.tabBarItem = homeTabItem
        
        let favTab = FavouriteVC()
        let favTabItem = UITabBarItem(title: "Favorite",
                                      image: Icons.tabBarFavorite.image,
                                      selectedImage: Icons.tabBarFavoriteFill.image)
        favTab.tabBarItem = favTabItem
        
        let settingsTab = SettingsVC()
        let settingsTabItem = UITabBarItem(title: "Settings",
                                           image: Icons.tabBarSettings.image,
                                           selectedImage: Icons.tabBarSettingsFill.image)
        settingsTab.tabBarItem = settingsTabItem
        
        self.viewControllers = [homeTab, favTab, settingsTab]
    }
    
    
    
    

  

}
