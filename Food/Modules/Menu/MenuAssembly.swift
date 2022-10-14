//
//  MenuAssembly.swift
//  Food
//
//  Created by Даниил Симахин on 14.10.2022.
//

import UIKit

class MenuAssembly {
    
    class func configuredModule() -> UIViewController {
        
        let view = MenuViewController()
    
        let presenter = MenuViewPresenter()
        let dataSource = DataSource()
        
        view.output = presenter
        
        presenter.input = view
        
        presenter.foods = dataSource.foods
        presenter.banners = dataSource.banners
        presenter.foodCategories = dataSource.foodCategories
        
        return view
    }
}
