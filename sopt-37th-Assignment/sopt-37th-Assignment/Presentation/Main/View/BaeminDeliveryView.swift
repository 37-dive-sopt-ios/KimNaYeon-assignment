//
//  BaeminDeliveryView.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 11/14/25.
//

import UIKit

import Then
import SnapKit

final class BaeminDeliveryView: BaseUIView {
    
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
    
    override func setUI() {
        addSubview(collectionView)
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(21)
        }
    }
    
    override func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func loadMockData() {
        data = DeliveryModel.mockData
        collectionView.reloadData()
    }
}

extension BaeminDeliveryView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("셀 선택됨: \(indexPath.row)")
    }
}

extension BaeminDeliveryView: UICollectionViewDataSource {
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

extension BaeminDeliveryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = UIScreen.main.bounds.width - 32
        let spacing: CGFloat = 12
        let cellWidth = (availableWidth - spacing * 4) / 5
        return CGSize(width: cellWidth, height: 78)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}
