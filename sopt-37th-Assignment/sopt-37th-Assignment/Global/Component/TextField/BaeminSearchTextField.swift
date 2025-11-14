//
//  BaeminSearchTextField.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 11/14/25.
//

import UIKit

import Then
import SnapKit

final class BaeminSearchTextField: BaseUIView {
    
    // MARK: - UI Components
    
    let textField = UITextField()
    private let searchButton = UIButton()
    
    
    // MARK: - SetUI
    
    override func setUI() {
        textField.do {
            $0.font = .body_r_14
            $0.textColor = .baeminGray700
            $0.tintColor = .baeminMint300
            $0.addPadding()
            $0.setPlaceholder(color: UIColor.baeminGray300)
            $0.placeholder = "찾아라! 맛있는 음식과 맛집"
            $0.layer.cornerRadius = 50
            $0.layer.masksToBounds = true
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.baeminBlack.cgColor
        }
        
        searchButton.do {
            $0.setImage(.search, for: .normal)
        }
    }
    
    
    // MARK: - SetLayout
    
    override func setLayout() {
        addSubviews(textField, searchButton)
        
        textField.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(17)
        }
    }
}
