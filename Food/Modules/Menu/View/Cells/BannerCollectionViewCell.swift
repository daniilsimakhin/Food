//
//  BannerCollectionViewCell.swift
//  Food
//
//  Created by Даниил Симахин on 14.10.2022.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Variable
    
    static let reuseIdentifier = String(describing: BannerCollectionViewCell.self)
    var banner: BannerModel! {
        didSet {
            bannerImageView.image = UIImage(named: banner.image)
        }
    }
    
    //MARK: - UI
    
    private lazy var bannerImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = C.Colors.MenuView.background
        view.contentMode = .scaleAspectFill
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

private extension BannerCollectionViewCell {
    func setupCell() {
        contentView.addSubview(bannerImageView)
        
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
