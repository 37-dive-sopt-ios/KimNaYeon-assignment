//
//  BannerModel.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 11/15/25.
//

import UIKit

public struct BannerModel {
    public let image: UIImage
    
    public init(image: UIImage) {
        self.image = image
    }
    
    public static let bannerMockData: [BannerModel] = [
        BannerModel(image: .power1),
        BannerModel(image: .power2),
        BannerModel(image: .power3),
        BannerModel(image: .power4),
    ]
}

