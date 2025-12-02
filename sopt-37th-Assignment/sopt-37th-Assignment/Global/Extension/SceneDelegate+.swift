//
//  SceneDelegate+.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 11/14/25.
//
import UIKit

extension SceneDelegate {
    static var shared: SceneDelegate? {
        UIApplication.shared.connectedScenes
            .compactMap{ $0.delegate }
            .first as? SceneDelegate
    }
    
    func changeRootViewController(_ vc: UIViewController) {
        guard let window = window else { return }
        UIView.transition(with: window,
                          duration: 0.3) {
            window.rootViewController = vc
        }
        window.makeKeyAndVisible()
    }
}
