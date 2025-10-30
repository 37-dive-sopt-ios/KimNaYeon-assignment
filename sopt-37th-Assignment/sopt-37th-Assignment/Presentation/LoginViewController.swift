//
//  LoginViewController.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 10/31/25.
//

import UIKit

import Then
import SnapKit

final class LoginViewController: BaseUIViewController {
    private let navigationBar = BaeminNavigationBar(title: "이메일 또는 아이디로 계속")
    private let idTextField = BaeminIdTextField()
    private let passwordTextField = BaeminPasswordTextField()
    private let loginButton = BaeminButton().then {
        $0.text = "로그인"
    }
    private let findAccountButton = AccountButton()
    
    override func setUI() {
        view.addSubviews(navigationBar, idTextField, passwordTextField, loginButton, findAccountButton)
    }
    
    override func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(45)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(42)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        findAccountButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
        }
    }
}
