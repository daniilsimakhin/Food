//
//  TabBarController.swift
//  Food
//
//  Created by Даниил Симахин on 13.10.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
}

//MARK: - TabBarController

private extension TabBarController {
    
    func setupTabBar() {
        setViewControllers([
            createNavigationController(MenuAssembly.configuredModule(), C.Texts.TabBar.menu, C.Images.TabBar.menu),
            createNavigationController(MenuAssembly.configuredModule(), C.Texts.TabBar.menu, C.Images.TabBar.menu)
        ], animated: true)
        tabBar.backgroundColor = C.Colors.TabBar.background
        tabBar.tintColor = C.Colors.TabBar.tint
        tabBar.barTintColor = C.Colors.TabBar.barTint
        tabBar.unselectedItemTintColor = C.Colors.TabBar.unselectedItemTint
    }
}
