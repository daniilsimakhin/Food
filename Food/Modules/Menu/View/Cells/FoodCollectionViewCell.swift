//
//  FoodCollectionViewCell.swift
//  Food
//
//  Created by Даниил Симахин on 14.10.2022.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    
    //MARK: - ConstanceConstratins
    typealias CC = ConstanceConstratins
    enum ConstanceConstratins {
        enum foodImageView {
            static let height: CGFloat = 150
            static let width: CGFloat = 150
        }
        enum descriptionLabel {
            static let topAnchor: CGFloat = 8
        }
        enum buyButton {
            static let height: CGFloat = 40
            static let width: CGFloat = 100
        }
        static let inset: CGFloat = 16
    }
    
    //MARK: - Variable
    
    static let reuseIdentifier = String(describing: FoodCollectionViewCell.self)
    var food: FoodModel! {
        didSet {
            foodImageView.image = UIImage(named: food.image)
            nameLabel.text = food.name
            descriptionLabel.text = food.description
            costLabel.text = "от \(food.cost) р"
        }
    }
    
    //MARK: - UI
    
    private lazy var foodImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = C.Colors.CollectionView.foodBackgroundCell
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = C.Colors.CollectionView.foodBackgroundCell
        view.font = .preferredFont(forTextStyle: .title3)
        view.textColor = C.Colors.Text.main
        view.numberOfLines = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = C.Colors.CollectionView.foodBackgroundCell
        view.font = .preferredFont(forTextStyle: .callout)
        view.textColor = C.Colors.Text.secondary
        view.numberOfLines = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var costLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = C.Colors.CollectionView.foodBackgroundCell
        view.textColor = C.Colors.Button.borderCell
        view.layer.borderColor = C.Colors.Button.borderCell?.cgColor
        view.layer.borderWidth = 1
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 7.5
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

private extension FoodCollectionViewCell {
    func setupCell() {
        backgroundColor = C.Colors.CollectionView.foodBackgroundCell
        
        contentView.addSubview(foodImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(costLabel)
        
        NSLayoutConstraint.activate([
            foodImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CC.inset),
            foodImageView.heightAnchor.constraint(equalToConstant: CC.foodImageView.height),
            foodImageView.widthAnchor.constraint(equalToConstant: CC.foodImageView.width),
            
            nameLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: CC.inset),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CC.inset),
            nameLabel.topAnchor.constraint(equalTo: foodImageView.topAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: CC.descriptionLabel.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: CC.inset),
            descriptionLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            
            costLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: CC.inset),
            costLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -CC.inset),
            costLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CC.inset),
            costLabel.widthAnchor.constraint(equalToConstant: CC.buyButton.width),
            costLabel.heightAnchor.constraint(equalToConstant: CC.buyButton.height),
        ])
    }
}
