//
//  CategoryCollectionViewCell.swift
//  Food
//
//  Created by Даниил Симахин on 14.10.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Variable
    
    static let reuseIdentifier = String(describing: CategoryCollectionViewCell.self)
    var category: String! {
        didSet {
            self.categoryButton.text = category
        }
    }
    
    //MARK: - UI
    
    lazy var categoryButton: UILabel = {
        let view = UILabel()
        view.backgroundColor = C.Colors.MenuView.background
        view.textColor = C.Colors.Button.borderCell
        view.layer.borderColor = C.Colors.Button.borderCell?.cgColor
        view.layer.borderWidth = 1
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private func

private extension CategoryCollectionViewCell {
    func setupCell() {
        contentView.addSubview(categoryButton)
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            categoryButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
