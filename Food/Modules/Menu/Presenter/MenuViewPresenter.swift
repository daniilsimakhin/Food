//
//  MenuViewPresenter.swift
//  Food
//
//  Created by Даниил Симахин on 14.10.2022.
//

import Foundation

protocol MenuViewPresenterInput: AnyObject {
    func pushCityView()
    func passFoodModel(_ food: FoodModel)
    func passBannerModel(_ banner: BannerModel)
    func passIndexFirstFood(_ foodsHeight: Int)
}

protocol MenuViewPresenterOutput: AnyObject {
    func didPressedAction()
    func didPressedFoodCell(_ indexPath: IndexPath)
    func didPressedBannerCell(_ indexPath: IndexPath)
    func searchCellWithCategory(_ indexPath: IndexPath)
    func getCategories() -> [FoodCategory]
    func getFoods() -> [FoodModel]
    func getBanners() -> [BannerModel]
}

class MenuViewPresenter {
    
    //MARK: - Variable
    
    var input: MenuViewPresenterInput!
    var foodCategories: [FoodCategory]!
    var foods: [FoodModel]!
    var banners: [BannerModel]!
}

//MARK: - MenuViewPresenterOutput

extension MenuViewPresenter: MenuViewPresenterOutput {
    func getFoods() -> [FoodModel] {
        return foods
    }
    
    func getBanners() -> [BannerModel] {
        return banners
    }
    
    func getCategories() -> [FoodCategory] {
        return foodCategories
    }
    
    func searchCellWithCategory(_ indexPath: IndexPath) {
        let category = foodCategories[indexPath.row]
        guard let indexFirstFood = foods.firstIndex(where: { food in food.type == category }) else { return }
        input.passIndexFirstFood(indexFirstFood)
    }
    
    func didPressedBannerCell(_ indexPath: IndexPath) {
        input.passBannerModel(banners[indexPath.row])
    }
    
    func didPressedFoodCell(_ indexPath: IndexPath) {
        input.passFoodModel(foods[indexPath.row])
    }
    
    func didPressedAction() {
        input.pushCityView()
    }
}
