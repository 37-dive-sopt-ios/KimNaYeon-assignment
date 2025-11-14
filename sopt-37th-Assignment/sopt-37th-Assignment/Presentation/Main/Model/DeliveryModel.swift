//
//  DeliveryModel.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 11/14/25.
//

import UIKit

public struct DeliveryModel {
    public let image: UIImage
    public let title: String
    
    public init(image: UIImage, title: String) {
        self.image = image
        self.title = title
    }
    
    public static let mockData: [DeliveryModel] = [
        DeliveryModel(image: .oni1, title: "한그릇"),
        DeliveryModel(image: .oni2, title: "치킨"),
        DeliveryModel(image: .oni3, title: "카페·디저트"),
        DeliveryModel(image: .oni4, title: "피자"),
        DeliveryModel(image: .oni5, title: "분식"),
        DeliveryModel(image: .oni6, title: "고기"),
        DeliveryModel(image: .oni7, title: "찜·탕"),
        DeliveryModel(image: .oni8, title: "야식"),
        DeliveryModel(image: .oni9, title: "패스트푸드"),
        DeliveryModel(image: .oni3, title: "픽업")
    ]
    
    public static let mockData2: [DeliveryModel] = [
        DeliveryModel(image: .oni1, title: "B마트"),
        DeliveryModel(image: .oni2, title: "CU"),
        DeliveryModel(image: .oni3, title: "이마트슈퍼"),
        DeliveryModel(image: .oni4, title: "홈플러스"),
        DeliveryModel(image: .oni5, title: "GS25"),
        DeliveryModel(image: .oni6, title: "이마트"),
    ]
}
