//
//  Constans.swift
//  Food
//
//  Created by Даниил Симахин on 14.10.2022.
//

import Foundation
import UIKit

typealias C = Constans
enum Constans {
    enum Images {
        enum TabBar {
            static let menu = "Menu"
        }
        
        enum MainView {
            static let arrowDown = "ArrowDown"
        }
    }
    
    enum Texts {
        enum TabBar {
            static let menu = "Меню"
        }
    }
    
    enum Colors {
        enum TabBar {
            static let background = UIColor(named: "backgroundTabBar")
            static let tint = UIColor(named: "tintTabBar")
            static let barTint = UIColor(named: "barTintTabBar")
            static let unselectedItemTint = UIColor(named: "unselectedItemTintTabBar")
        }
        
        enum Text {
            static let main = UIColor(named: "mainText")
            static let secondary = UIColor(named: "secondaryText")
        }
        
        enum MenuView {
            static let background = UIColor(named: "backgroundMenuView")
        }
        
        enum CollectionView {
            static let backgroundCollectionView = UIColor(named: "backgroundCollectionView")
            static let foodBackgroundCell = UIColor(named: "foodBackgroundCell")
        }
        
        enum Button {
            static let selectedButton = UIColor(named: "selectedButton")
            static let normalButton = UIColor(named: "foodBackgroundCell")
            static let borderCell = UIColor(named: "borderCell")
        }
    }
}
