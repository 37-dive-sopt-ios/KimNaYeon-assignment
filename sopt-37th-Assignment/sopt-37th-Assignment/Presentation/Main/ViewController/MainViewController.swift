//
//  MainViewController.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 11/14/25.
//

import UIKit

import Then
import SnapKit

final class MainViewController: BaseUIViewController {
    
    // MARK: - UI Components
    
    private let myHouseButton = MyHouseButton()
    
    private let discountImage = UIImageView().then {
        $0.image = .baeminDiscount
    }
    private let alarmImage = UIImageView().then {
        $0.image = .alarm
    }
    private let cartImage = UIImageView().then {
        $0.image = .cart
    }
    
    private let searchTextField = BaeminSearchTextField()
    
    private let bMartImage = UIImageView().then {
        $0.image = .bMart
    }
    private let bMartButton = BMartButton()
    
    private let categoryView = BaeminCategoryContainerView()
    
    private let bMartView = BMartView()
    
    private let bannerView = BannerView()
    
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    private let contentView = UIView()
    
    private lazy var iconStack = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 12
        $0.alignment = .center
        $0.distribution = .fillEqually
    }
        
    // MARK: - SetUI
    
    override func setUI() {
        iconStack.addArrangedSubviews(discountImage, alarmImage, cartImage)
        view.addSubviews(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(searchTextField, myHouseButton, iconStack, bMartImage, bMartButton, categoryView, bMartView, bannerView)
    }
    
    
    // MARK: - SetLayout
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        myHouseButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(9)
            $0.leading.equalToSuperview().inset(16)
        }
                
        iconStack.snp.makeConstraints {
            $0.centerY.equalTo(myHouseButton)
            $0.trailing.equalToSuperview().inset(16)
        }
                
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(myHouseButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
                
        bMartImage.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(16)
        }
        
        bMartButton.snp.makeConstraints {
            $0.top.equalTo(bMartImage.snp.bottom).offset(6)
            $0.leading.equalTo(bMartImage.snp.leading).offset(-13)
        }
                
        categoryView.snp.makeConstraints {
            $0.top.equalTo(bMartButton.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(283)
        }
                
        bMartView.snp.makeConstraints {
            $0.top.equalTo(categoryView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(116)
        }
        
        bannerView.snp.makeConstraints {
            $0.top.equalTo(bMartView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(124)
            $0.bottom.equalToSuperview().offset(-40)
        }
    }
}
