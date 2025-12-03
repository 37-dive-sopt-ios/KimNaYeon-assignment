//
//  LoginViewModel.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 12/3/25.
//

import UIKit

import Combine

final class LoginViewModel: ViewModelProtocol {
    struct Input {
        let email: AnyPublisher<String, Never>
        let password: AnyPublisher<String, Never>
        let loginTap: AnyPublisher<Void, Never>
    }
    
    struct Output {
        let isLoginEnabled: AnyPublisher<Bool, Never>
        let showToast: AnyPublisher<String, Never>
        let loginSuccess: AnyPublisher<String, Never>
    }
    
    private var cancellables = Set<AnyCancellable>()

    func transform(_ input: Input) -> Output {
        let isLoginEnabled = Publishers
            .CombineLatest(input.email, input.password)
            .map { !$0.0.isEmpty && !$0.1.isEmpty }
            .eraseToAnyPublisher()

        let emailError = input.loginTap
            .combineLatest(input.email)
            .compactMap { _, email -> String? in
                email.isValidEmail ? nil : "형식이 다릅니다."
            }
            .eraseToAnyPublisher()

        let passwordError = input.loginTap
            .combineLatest(input.password)
            .compactMap { _, password -> String? in
                password.isValidPassword ? nil : "형식이 다릅니다."
            }
            .eraseToAnyPublisher()

        let showToast = Publishers
            .Merge(emailError, passwordError)
            .eraseToAnyPublisher()

        let loginSuccess = Publishers.CombineLatest(input.email, input.password)
            .share()
            .filter { email, password in
                email.isValidEmail && password.isValidPassword
            }
            .map { email, _ in email }
            .eraseToAnyPublisher()

        return Output(
            isLoginEnabled: isLoginEnabled,
            showToast: showToast,
            loginSuccess: loginSuccess
        )
    }
}
