//
//  UIFont+.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 10/29/25.
//

import UIKit

extension UIFont {

    enum Typography {
        case head_b_24
        case head_b_18
        case title_sb_18
        case body_r_14
        case caption_r_10

        var font: UIFont {
            switch self {
            case .head_b_24:
                return UIFont(name: "Pretendard-Bold", size: 24)!
            case .head_b_18:
                return UIFont(name: "Pretendard-Bold", size: 18)!
            case .title_sb_18:
                return UIFont(name: "Pretendard-SemiBold", size: 18)!
            case .body_r_14:
                return UIFont(name: "Pretendard-Regular", size: 14)!
            case .caption_r_10:
                return UIFont(name: "Pretendard-Regular", size: 10)!
            }
        }

        var letterSpacing: CGFloat {
            switch self {
            case .head_b_24, .head_b_18:
                return -0.02 * font.pointSize
            case .title_sb_18:
                return -0.03 * font.pointSize
            case .body_r_14, .caption_r_10:
                return -0.04 * font.pointSize
            }
        }

        var lineHeight: CGFloat {
            return font.pointSize * 1.0
        }
    }
}

