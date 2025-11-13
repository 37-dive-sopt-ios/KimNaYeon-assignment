//
//  BaeminTabBar.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 11/14/25.
//

import UIKit

class BaeminTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        appearance()
    }

    func setTabBar() {
        let vc1 = UINavigationController(rootViewController: RedViewController())
        vc1.tabBarItem = UITabBarItem(title: "홈", image: .home, tag: 1)
        let vc2 = UINavigationController(rootViewController: RedViewController())
        vc2.tabBarItem = UITabBarItem(title: "장보기·쇼핑", image: .shopping, tag: 2)
        let vc3 = UINavigationController(rootViewController: RedViewController())
        vc3.tabBarItem = UITabBarItem(title: "찜", image: .jjim, tag: 3)
        let vc4 = UINavigationController(rootViewController: RedViewController())
        vc4.tabBarItem = UITabBarItem(title: "주문내역", image: .order, tag: 4)
        let vc5 = UINavigationController(rootViewController: RedViewController())
        vc5.tabBarItem = UITabBarItem(title: "마이배민", image: .myBaemin, tag: 4)
        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
    }
    
    func appearance() {
        let barAppearance = UITabBarAppearance()
        
        // 배경
        barAppearance.configureWithOpaqueBackground()
        barAppearance.backgroundColor = .baeminWhite
        
        // 아이콘 기본 색상 설정
        barAppearance.stackedLayoutAppearance.normal.iconColor = .baeminGray700
        barAppearance.stackedLayoutAppearance.selected.iconColor = .baeminBlack
        barAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .font: UIFont.title_sb_10,
            .foregroundColor: UIColor.baeminGray700
        ]
        barAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .font: UIFont.title_sb_10,
            .foregroundColor: UIColor.baeminBlack
        ]
        
        // 실제 탭바에 커스텀한 Appearance 적용
        self.tabBar.standardAppearance = barAppearance
        self.tabBar.scrollEdgeAppearance = barAppearance
        
        // 그림자 설정
        self.tabBar.layer.shadowColor = UIColor.baeminBlack.cgColor
        self.tabBar.layer.shadowOpacity = 0.05
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -4)
        
        // 탭바 아이템 위치 조정
        self.tabBar.itemPositioning = .centered
        self.tabBar.itemSpacing = 31
    }
}
