//
//  BaeminMoreView.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 11/14/25.
//

import UIKit

import Then
import SnapKit

final class BaeminMoreView: BaseUIView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel().then {
        $0.font = .body_r_14
    }
    
    private let arrow = UIImageView().then {
        $0.image = .chevronRight
    }
    
    private lazy var stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .equalSpacing
        $0.spacing = 4
    }
    
    
    // MARK: - Init
    
    init(title: String) {
        super.init(frame: .zero)
        updateTitle(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - SetUI
    
    override func setUI() {
        addSubviews(stackView)
        stackView.addArrangedSubviews(titleLabel, arrow)
    }
    
    
    // MARK: - SetLayout
    
    override func setLayout() {
        stackView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
extension BaeminMoreView {
    func updateTitle(_ text: String) {
        titleLabel.text = "\(text)에서 더보기"
    }
}
