//
//  BaeminCategoryTabView.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 11/14/25.
//

import UIKit

import Then
import SnapKit

protocol BaeminCategoryTabViewDelegate: AnyObject {
    func didSelectCategory(index: Int)
}

final class BaeminCategoryTabView: BaseUIView {
    
    //MARK: - Properties
    
    weak var delegate: BaeminCategoryTabViewDelegate?
    
    private let titles: [String]
    
    
    //MARK: - UI Components
    
    private lazy var stackView = UIStackView()
    private let scrollView = UIScrollView()
    private let indicator = UIView()
    
    private var buttons: [UIButton] = []
    private var selectedButtonIndex: Int = 0
    
    
    // MARK: - Init
    
    init(titles: [String]) {
        self.titles = titles
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - SetUI
    
    override func setUI() {
        stackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .equalSpacing
            $0.spacing = 10
        }
        
        scrollView.do {
            $0.showsHorizontalScrollIndicator = false
        }
        
        indicator.do {
            $0.backgroundColor = .baeminBlack
        }
        
        titles.enumerated().forEach { index, title in
            let button = UIButton(type: .system).then {
                $0.setTitle(title, for: .normal)
                $0.setTitleColor(.baeminGray300, for: .normal)
                $0.setTitleColor(.baeminBlack, for: .selected)
                $0.titleLabel?.font = .title_sb_18
                $0.tag = index
                $0.addTarget(self, action: #selector(titleButtonDidTapped(_:)), for: .touchUpInside)
            }
            stackView.addArrangedSubview(button)
            buttons.append(button)
        }
        moveIndicator(to: buttons.first!)
    }
    
    
    // MARK: - SetLayout
    
    override func setLayout() {
        addSubviews(scrollView, indicator)
        scrollView.addSubviews(stackView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        
        indicator.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(1)
            $0.height.equalTo(3)
        }
    }
}

extension BaeminCategoryTabView {
    @objc private func titleButtonDidTapped(_ sender: UIButton) {
        selectedButtonIndex = sender.tag
        delegate?.didSelectCategory(index: sender.tag)
        moveIndicator(to: sender)
    }
    
    private func moveIndicator(to button: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.indicator.snp.remakeConstraints {
                $0.bottom.equalTo(self.scrollView.snp.bottom).offset(1)
                $0.height.equalTo(3)
                $0.width.equalTo(button.titleLabel!.intrinsicContentSize.width)
                $0.leading.equalTo(button.snp.leading)
            }
            self.layoutIfNeeded()
        }
    }
}
