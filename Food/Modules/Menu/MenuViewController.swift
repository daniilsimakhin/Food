//
//  MenuViewController.swift
//  Food
//
//  Created by Даниил Симахин on 13.10.2022.
//

import UIKit

class MenuViewController: UIViewController {

    var menuView = MenuView()
    var output: MenuViewPresenterOutput!
    
    override func loadView() {
        view = menuView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.delegate = self
    }
}

//MARK: - MenuViewDelegate

extension MenuViewController: MenuViewDelegate {
    
    func pressedFavoriteButton() {
        output.didPressedAction()
    }
}

//MARK: - MenuViewPresenterInput

extension MenuViewController: MenuViewPresenterInput {
    func printTest(_ data: String) {
        menuView.textLabel.text = data
    }
}
