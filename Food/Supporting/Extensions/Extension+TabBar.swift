//
//  Extension+TabBar.swift
//  Food
//
//  Created by Даниил Симахин on 13.10.2022.
//

import UIKit

extension UITabBarController {
    
    func createNavigationController(_ viewController: UIViewController, _ title: String, _ imageName: String) -> UIViewController {
        let tabBarItem = UITabBarItem()
        tabBarItem.image = UIImage(named: imageName)
        tabBarItem.title = title
        viewController.tabBarItem = tabBarItem
        return viewController
    }
}
