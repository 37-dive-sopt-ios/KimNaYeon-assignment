//
//  BannerCell.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 11/15/25.
//

import UIKit

import Then
import SnapKit

final class BannerCell: UICollectionViewCell {
    
    private let bannerImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bannerImageView)
        
        bannerImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) { fatalError() }
}

extension BannerCell {
    func configure(data: BannerModel) {
        bannerImageView.image = data.image
    }
}
