//
//  BaeminCategoryContainerView.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 11/14/25.
//


import UIKit

import Then
import SnapKit

final class BaeminCategoryContainerView: BaseUIView {
    
    // MARK: - Properties
    private let categories = ["음식배달", "픽업", "장보기·쇼핑", "선물하기", "혜택모아보기"]
    private lazy var categoryTabView = BaeminCategoryTabView(titles: categories)
    
    private let backgroundContainer = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.layer.masksToBounds = false
        $0.layer.shadowColor = UIColor.baeminMint300.cgColor
        $0.layer.shadowOpacity = 0.25
        $0.layer.shadowOffset = CGSize(width: 0, height: -4)
    }
    
    private lazy var borderView1 = UIView().then {
        $0.backgroundColor = .baeminbaeminBackgroundWhite
    }
    private lazy var borderView2 = UIView().then {
        $0.backgroundColor = .baeminbaeminBackgroundWhite
    }
    
    private let contentContainer = UIView()
    private let moreView = BaeminMoreView(title: "음식배달")
    private lazy var secondView = UIView().then {
        $0.backgroundColor = .blue
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        switchContent(index: 0)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }
    
    
    // MARK: - SetUI
    
    override func setUI() {
        addSubview(backgroundContainer)
        backgroundContainer.addSubviews(categoryTabView, borderView1, contentContainer, borderView2, moreView)
    }
    
    
    // MARK: - SetLayout
    
    override func setLayout() {
        backgroundContainer.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        categoryTabView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        borderView1.snp.makeConstraints {
            $0.top.equalTo(categoryTabView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        contentContainer.snp.makeConstraints {
            $0.top.equalTo(borderView1.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(201)
        }
        
        borderView2.snp.makeConstraints {
            $0.top.equalTo(contentContainer.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        moreView.snp.makeConstraints {
            $0.top.equalTo(borderView2.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(34)
        }
    }
    
    override func setDelegate() {
        categoryTabView.delegate = self
    }
}

extension BaeminCategoryContainerView {
    private func switchContent(index: Int) {
        contentContainer.subviews.forEach { $0.removeFromSuperview() }
        let newView: UIView
        if index == 0 {
            newView = BaeminDeliveryView()
        } else {
            newView = secondView
        }
        contentContainer.addSubview(newView)
        newView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        moreView.updateTitle(categories[index])
    }
}

extension BaeminCategoryContainerView: BaeminCategoryTabViewDelegate {
    func didSelectCategory(index: Int) {
        switchContent(index: index)
    }
}
