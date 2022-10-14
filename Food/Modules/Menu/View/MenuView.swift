//
//  MenuView.swift
//  Food
//
//  Created by Даниил Симахин on 14.10.2022.
//

import UIKit

protocol MenuViewInput: AnyObject {
    func setContentOffset(_ indexFood: Int)
}

protocol MenuViewOutput: AnyObject {
    func pressedSetCityButton()
    func pressedFoodCell(_ indexPath: IndexPath)
    func pressedBannerCell(_ indexPath: IndexPath)
    func passingCategoryIndex(_ indexPath: IndexPath)
    
    func getCategories() -> [FoodCategory]
    func getFoods() -> [FoodModel]
    func getBanners() -> [BannerModel]
}

class MenuView: UIView {
    
    //MARK: - ConstanceConstrains
    
    typealias CC = ConstanceConstrains
    enum ConstanceConstrains {
        enum headerView {
            static let height: CGFloat = 100
        }
        enum cityLabel {
            static let leadingAnchor: CGFloat = 15
            static let bottomAnchor: CGFloat = -5
        }
        enum cityButton {
            static let trailingAnchor: CGFloat = 10
            static let bottomAnchor: CGFloat = -5
        }
        enum collectionView {
            static let bannerCellHeight: CGFloat = 140
            static let categoryHeaderHeight: CGFloat = 80
            static let foodCellHeight: CGFloat = 200
        }
    }
    
    //MARK: - Variable
    
    weak var output: MenuViewOutput?
    
    //MARK: - UI
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: bounds, collectionViewLayout: configureLayout())
        view.backgroundColor = C.Colors.MenuView.background
        view.delegate = self
        view.dataSource = self
        view.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.reuseIdentifier)
        view.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: FoodCollectionViewCell.reuseIdentifier)
        view.register(CategoryCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoryCollectionReusableView.reuseIdentifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = C.Colors.MenuView.background
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var cityLabel: UILabel = {
        let view = UILabel()
        view.text = "Москва"
        view.backgroundColor = C.Colors.MenuView.background
        view.font = .preferredFont(forTextStyle: .title3)
        view.textColor = C.Colors.Text.main
        view.backgroundColor = C.Colors.MenuView.background
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var cityButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: C.Images.MainView.arrowDown), for: .normal)
        view.addTarget(self, action: #selector(didPressedSetCityButton(_:)), for: .touchUpInside)
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

private extension MenuView {
    
    func setupView() {
        isUserInteractionEnabled = true
        backgroundColor = C.Colors.MenuView.background
        
        addSubview(headerView)
        addSubview(collectionView)
        headerView.addSubview(cityLabel)
        headerView.addSubview(cityButton)
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: CC.headerView.height),
            
            cityLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: CC.cityLabel.leadingAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: CC.cityLabel.bottomAnchor),
            
            cityButton.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor, constant: CC.cityButton.trailingAnchor),
            cityButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: CC.cityButton.bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func configureLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionProvider, env in
            switch sectionProvider {
            case 0:
                return self.createBannerSection()
            default:
                return self.createItemSection()
            }
        }
        return layout
    }
    
    private func createBannerSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(CC.collectionView.bannerCellHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func createItemSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(CC.collectionView.foodCellHeight))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 0, bottom: 1, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(CC.collectionView.categoryHeaderHeight))
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        headerElement.pinToVisibleBounds = true
        section.boundarySupplementaryItems = [headerElement]
        return section
    }
}

//MARK: - @objc private func

@objc private extension MenuView {
    func didPressedSetCityButton(_ sender: UIButton!) {
        output?.pressedSetCityButton()
    }
}

//MARK: - UICollectionViewDelegate

extension MenuView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            output?.pressedBannerCell(indexPath)
        default:
            output?.pressedFoodCell(indexPath)
        }
    }
}

//MARK: - UICollectionViewDataSource

extension MenuView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return output?.getBanners().count ?? 0
        default:
            return output?.getFoods().count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.reuseIdentifier, for: indexPath) as? BannerCollectionViewCell else { fatalError("Cannot create \(String(describing: BannerCollectionViewCell.self))") }
            cell.banner = output?.getBanners()[indexPath.row]
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCollectionViewCell.reuseIdentifier, for: indexPath) as? FoodCollectionViewCell else { fatalError("Cannot create \(String(describing: FoodCollectionViewCell.self))") }
            cell.food = output?.getFoods()[indexPath.row]
            
            if indexPath.row == 0 {
                let path = UIBezierPath(roundedRect: cell.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 30, height: 10))
                let mask = CAShapeLayer()
                mask.path = path.cgPath
                cell.layer.mask = mask
                cell.layer.masksToBounds = true
            } else {
                cell.layer.mask = nil
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoryCollectionReusableView.reuseIdentifier, for: indexPath) as? CategoryCollectionReusableView else {
            fatalError("Cannot create \(String(describing: CategoryCollectionReusableView.self))")
        }
        cell.output = self
        return cell
    }
}

//MARK: - CategoryCollectionReusableViewOutput

extension MenuView: CategoryCollectionReusableViewOutput {
    func didPressedOnCategory(_ indexPath: IndexPath) {
        output?.passingCategoryIndex(indexPath)
    }
    
    func getFoodCategories() -> [FoodCategory] {
        return output?.getCategories() ?? []
    }
}

extension MenuView: MenuViewInput {
    func setContentOffset(_ indexFood: Int) {
        let offset = CGFloat(indexFood) * CC.collectionView.foodCellHeight + CC.headerView.height + CC.collectionView.categoryHeaderHeight / 2
        collectionView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
    }
}
