//
//  BaeminSmallCell.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 11/14/25.
//

import UIKit

import Then
import SnapKit

final class BaeminSmallCell: UICollectionViewCell {
    
    // MARK: - UIComponents
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
    }
    private let titleLabel = UILabel()
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
       
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - SetLayout
    
    private func setLayout() {
        contentView.addSubviews(imageView, titleLabel)
        
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(58)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(12)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(12)
            $0.bottom.equalToSuperview()
        }
    }
}
extension BaeminSmallCell {
    public func configure(data: DeliveryModel) {
        imageView.image = data.image
        titleLabel.text = data.title
    }
}
