//
//  ViewModelProtocol.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 12/3/25.
//


import Combine

protocol ViewModelProtocol {
    associatedtype Input
    associatedtype Output

    func transform(_ input: Input) -> Output
}
