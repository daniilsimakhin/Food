//
//  DataSource.swift
//  Food
//
//  Created by Даниил Симахин on 14.10.2022.
//

import Foundation

struct DataSource {
    let foodCategories = [FoodCategory.Pizza, FoodCategory.Combo, FoodCategory.Desserts, FoodCategory.Drinks]
    let foods = [FoodModel(image: "FoodTest", name: "Ветчина и грибы ", description: "Баварские колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус", cost: 345, type: .Pizza),
                 FoodModel(image: "FoodTest", name: "Баварские колбаски ", description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус", cost: 345, type: .Pizza),
                 FoodModel(image: "FoodTest", name: "Нежный лосось", description: "Лосось, томаты черри, моцарелла, соус песто", cost: 345, type: .Pizza),
                 FoodModel(image: "FoodTest", name: "Нежный лосось", description: "Лосось, томаты черри, моцарелла, соус песто", cost: 345, type: .Pizza),
                 FoodModel(image: "FoodTest", name: "Нежный лосось", description: "Лосось, томаты черри, моцарелла, соус песто", cost: 345, type: .Pizza),
                 FoodModel(image: "FoodTest", name: "Нежный лосось", description: "Лосось, томаты черри, моцарелла, соус песто", cost: 345, type: .Pizza),
                 FoodModel(image: "ComboTest", name: "Комбо набор", description: "Пицца, сода, картошка", cost: 999, type: .Combo),
                 FoodModel(image: "DessertTest", name: "Красный бархат", description: "Пироженное", cost: 199, type: .Desserts),
                 FoodModel(image: "DrinkTest", name: "Sprite", description: "Лимонад\nобъем: 0.25", cost: 45, type: .Drinks),
                 FoodModel(image: "DrinkTest", name: "Sprite", description: "Лимонад\nобъем: 0.5", cost: 70, type: .Drinks),
                 FoodModel(image: "DrinkTest", name: "Sprite", description: "Лимонад\nобъем: 0.75", cost: 100, type: .Drinks),
                 FoodModel(image: "DrinkTest", name: "Sprite", description: "Лимонад\nобъем: 1.0", cost: 115, type: .Drinks),
                 FoodModel(image: "DrinkTest", name: "Sprite", description: "Лимонад\nобъем: 1.5", cost: 130, type: .Drinks),
                 ]
    let banners = [BannerModel(image: "BannerTest"),
                  BannerModel(image: "BannerTest"),
                  BannerModel(image: "BannerTest"),
                  BannerModel(image: "BannerTest"),
                  BannerModel(image: "BannerTest")]
}
