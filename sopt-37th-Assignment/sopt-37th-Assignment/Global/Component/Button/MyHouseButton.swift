//
//  MyHouseButton.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 10/31/25.
//

import UIKit

import Then
import SnapKit

public final class MyHouseButton: UIButton {
    
    // MARK: - Init
    
    public init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup
    
    private func setup() {
        configuration = .plain()
        
        var attributedTitle = AttributedString("우리집")
        attributedTitle.font = .head_b_16
        attributedTitle.foregroundColor = .baeminBlack
        configuration?.attributedTitle = attributedTitle
        
        configuration?.image = .myHouse
        configuration?.imagePlacement = .trailing
        configuration?.imagePadding = 3
        configuration?.baseForegroundColor = .baeminBlack
    }
}
