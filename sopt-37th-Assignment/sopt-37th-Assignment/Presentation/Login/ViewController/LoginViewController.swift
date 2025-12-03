//
//  LoginViewController.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 10/31/25.
//

import UIKit

import Combine
import Then
import SnapKit

final class LoginViewController: BaseUIViewController {
    private let loginView = LoginView()
    private let viewModel = LoginViewModel()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let emailSubject = PassthroughSubject<String, Never>()
    private let passwordSubject = PassthroughSubject<String, Never>()
    private let loginTapSubject = PassthroughSubject<Void, Never>()
    
    override func setUI() {
        view.addSubviews(loginView)
    }
    
    override func setLayout() {
        loginView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        loginView.idTextField.textField.addTarget(self, action: #selector(idChanged), for: .editingChanged)
        loginView.passwordTextField.textField.addTarget(self, action: #selector(passwordChanged), for: .editingChanged)
        loginView.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    override func setBind() {
        let input = LoginViewModel.Input(
            email: emailSubject.eraseToAnyPublisher(),
            password: passwordSubject.eraseToAnyPublisher(),
            loginTap: loginTapSubject.eraseToAnyPublisher()
        )
        
        let output = viewModel.transform(input)
        
        output.isLoginEnabled
            .receive(on: RunLoop.main)
            .sink { [weak self] isEnabled in
                self?.loginView.loginButton.isDisabled = !isEnabled
            }
            .store(in: &cancellables)
        
        output.showToast
            .receive(on: RunLoop.main)
            .sink { [weak self] message in
                guard let self else { return }
                self.loginView.toast.makeToast(on: self.loginView, message: message)
            }
            .store(in: &cancellables)
        
        output.loginSuccess
            .receive(on: RunLoop.main)
            .sink { [weak self] email in
                let vc = WelcomeViewController()
                vc.email = email
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            .store(in: &cancellables)
    }
}

extension LoginViewController {
    @objc private func idChanged(_ sender: UITextField) {
        emailSubject.send(sender.text ?? "")
    }

    @objc private func passwordChanged(_ sender: UITextField) {
        passwordSubject.send(sender.text ?? "")
    }
    
    @objc private func loginTapped() {
        loginTapSubject.send(())
    }
}
