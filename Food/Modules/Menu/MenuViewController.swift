//
//  MenuViewController.swift
//  Food
//
//  Created by Даниил Симахин on 13.10.2022.
//

import UIKit

class MenuViewController: UIViewController {

    //MARK: - Variable
    
    var menuView = MenuView()
    var output: MenuViewPresenterOutput!
    var input: MenuViewInput!
    
    //MARK: - Init
    
    override func loadView() {
        view = menuView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.output = self
        input = menuView
    }
}

//MARK: - MenuViewOutput

extension MenuViewController: MenuViewOutput {
    func getFoods() -> [FoodModel] {
        return output.getFoods()
    }
    
    func getBanners() -> [BannerModel] {
        return output.getBanners()
    }
    
    func getCategories() -> [FoodCategory] {
        return output.getCategories()
    }
    
    func passingCategoryIndex(_ indexPath: IndexPath) {
        output.searchCellWithCategory(indexPath)
    }
    
    func pressedBannerCell(_ indexPath: IndexPath) {
        output.didPressedBannerCell(indexPath)
    }
    
    func pressedFoodCell(_ indexPath: IndexPath) {
        output.didPressedFoodCell(indexPath)
    }
    
    func pressedSetCityButton() {
        output.didPressedAction()
    }
}

//MARK: - MenuViewPresenterInput

extension MenuViewController: MenuViewPresenterInput {
    
    func passIndexFirstFood(_ foodsHeight: Int) {
        input.setContentOffset(foodsHeight)
    }
    
    func passBannerModel(_ banner: BannerModel) {
        print("Open detail banner view")
    }
    
    func passFoodModel(_ food: FoodModel) {
        print("Open detail food view")
    }
    
    func pushCityView() {
        print("Open set city view")
    }
}
