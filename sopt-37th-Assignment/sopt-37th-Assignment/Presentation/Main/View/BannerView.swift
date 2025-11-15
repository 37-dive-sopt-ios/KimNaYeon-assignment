//
//  BannerView.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 11/15/25.
//

import UIKit

import Then
import SnapKit

final class BannerView: BaseUIView {
    
    private var data: [BannerModel] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
        return collectionView
    }()
    
    private let borderView = UIView().then {
        $0.backgroundColor = .baeminbaeminBackgroundWhite
    }
    
    override func setUI() {
        addSubviews(collectionView, borderView)
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
        }
        
        borderView.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(10)
        }
    }
    
    override func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func loadMockData() {
        data = BannerModel.bannerMockData
        collectionView.reloadData()
    }
}

extension BannerView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("셀 선택됨: \(indexPath.row)")
    }
}

extension BannerView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.identifier, for: indexPath) as? BannerCell else {
            return UICollectionViewCell()
        }
        cell.configure(data: data[indexPath.item])
        return cell
    }
}

extension BannerView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height: CGFloat = 114
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
