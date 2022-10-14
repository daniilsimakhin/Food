//
//  FoodModel.swift
//  Food
//
//  Created by Даниил Симахин on 14.10.2022.
//

import Foundation

enum FoodCategory: String, CaseIterable {
    case Pizza = "Пицца"
    case Combo = "Комбо"
    case Drinks = "Напитки"
    case Desserts = "Десерты"
}

struct FoodModel {
    let image: String
    let name: String
    let description: String
    let cost: Int
    let type: FoodCategory
}
