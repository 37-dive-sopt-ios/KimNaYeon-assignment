//
//  BMartView.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 11/14/25.
//

import UIKit

import Then
import SnapKit

final class BMartView: BaseUIView {
    
    private var data: [DeliveryModel] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(BaeminSmallCell.self, forCellWithReuseIdentifier: BaeminSmallCell.identifier)
        return collectionView
    }()
    
    private lazy var borderView1 = UIView().then {
        $0.backgroundColor = .baeminbaeminBackgroundWhite
    }
    
    private lazy var borderView2 = UIView().then {
        $0.backgroundColor = .baeminbaeminBackgroundWhite
    }
    
    override func setUI() {
        addSubviews(borderView1, collectionView, borderView2)
    }
    
    override func setLayout() {
        borderView1.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(10)
        }
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(11)
            $0.height.equalTo(74)
        }
        borderView2.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(10)
        }
    }
    
    override func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func loadMockData() {
        data = DeliveryModel.mockData2
        collectionView.reloadData()
    }
}

extension BMartView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("셀 선택됨: \(indexPath.row)")
    }
}

extension BMartView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaeminSmallCell.identifier, for: indexPath) as? BaeminSmallCell else {
            return UICollectionViewCell()
        }
        cell.configure(data: data[indexPath.item])
        return cell
    }
}

extension BMartView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 58, height: 74)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
