//
//  DataSource.swift
//  Food
//
//  Created by Даниил Симахин on 14.10.2022.
//

import Foundation

struct DataSource {
    let data = [FoodType.Pizza, FoodType.Drinks]
    let foods = [FoodItemModel(image: "FoodTest", name: "Ветчина и грибы ", description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус", cost: 345, type: .Pizza),
                 FoodItemModel(image: "FoodTest", name: "Баварские колбаски ", description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус", cost: 345, type: .Pizza),
                 FoodItemModel(image: "FoodTest", name: "Нежный лосось", description: "Лосось, томаты черри, моцарелла, соус песто", cost: 345, type: .Pizza),
                 FoodItemModel(image: "FoodTest", name: "Нежный лосось", description: "Лосось, томаты черри, моцарелла, соус песто", cost: 345, type: .Pizza),
                 FoodItemModel(image: "FoodTest", name: "Нежный лосось", description: "Лосось, томаты черри, моцарелла, соус песто", cost: 345, type: .Pizza),
                 FoodItemModel(image: "FoodTest", name: "Нежный лосось", description: "Лосось, томаты черри, моцарелла, соус песто", cost: 345, type: .Pizza),
                 FoodItemModel(image: "DrinkTest", name: "Sprite", description: "Лимонад", cost: 345, type: .Drinks),
                 FoodItemModel(image: "DrinkTest", name: "Sprite", description: "Лимонад", cost: 345, type: .Drinks),
                 FoodItemModel(image: "DrinkTest", name: "Sprite", description: "Лимонад", cost: 345, type: .Drinks),
                 FoodItemModel(image: "DrinkTest", name: "Sprite", description: "Лимонад", cost: 345, type: .Drinks),
                 FoodItemModel(image: "DrinkTest", name: "Sprite", description: "Лимонад", cost: 345, type: .Drinks),]
    let banners = [BannerModel(image: "BannerTest"),
                  BannerModel(image: "BannerTest"),
                  BannerModel(image: "BannerTest"),
                  BannerModel(image: "BannerTest"),
                  BannerModel(image: "BannerTest")]
}
