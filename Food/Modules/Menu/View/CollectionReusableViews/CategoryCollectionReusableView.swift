//
//  CategoryCollectionReusableView.swift
//  Food
//
//  Created by Даниил Симахин on 14.10.2022.
//

import UIKit

protocol CategoryCollectionReusableViewOutput: AnyObject {
    func didPressedOnCategory(_ indexPath: IndexPath)
    func getFoodCategories() -> [FoodCategory]
}

class CategoryCollectionReusableView: UICollectionReusableView {
    
    //MARK: - Variable
    
    static let reuseIdentifier = String(describing: CategoryCollectionReusableView.self)
    weak var output: CategoryCollectionReusableViewOutput?
    
    //MARK: - UI
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: bounds, collectionViewLayout: configureLayout())
        view.dataSource = self
        view.delegate = self
        view.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier)
        view.backgroundColor = C.Colors.MenuView.background
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Private func

private extension CategoryCollectionReusableView {
    func setupView() {
        isUserInteractionEnabled = true
        backgroundColor = C.Colors.MenuView.background
        
        addSubview(collectionView)
    }
    
    func configureLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension CategoryCollectionReusableView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell else {
            fatalError("Cannot create \(CategoryCollectionViewCell.self)")
        }
        cell.categoryButton.backgroundColor = C.Colors.Button.selectedButton
        output?.didPressedOnCategory(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell else {
            fatalError("Cannot create \(CategoryCollectionViewCell.self)")
        }
        cell.categoryButton.backgroundColor = C.Colors.MenuView.background
    }
}

//MARK: - UICollectionViewDataSource

extension CategoryCollectionReusableView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return output?.getFoodCategories().count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        guard let category = output?.getFoodCategories()[indexPath.row].rawValue else {
            return cell
        }
        cell.category = category
        return cell
    }
}
