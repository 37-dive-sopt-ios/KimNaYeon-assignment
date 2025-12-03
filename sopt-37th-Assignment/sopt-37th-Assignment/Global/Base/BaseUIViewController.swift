//
//  BaseUIViewController.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 10/29/25.
//

import UIKit

class BaseUIViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .baeminWhite
        
        setUI()
        setLayout()
        addTarget()
        setDelegate()
        setBind()
        
        hideKeyboardWhenTappedAround()
        navigationItem.hidesBackButton = true
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: - Custom Method
    
    func setUI() {}
    
    func setLayout() {}
    
    // MARK: - Action Method
    
    func addTarget() {}
    
    // MARK: - delegate Method
    
    func setDelegate() {}
    
    
    // MARK: - bind to ViewModel Method
    
    func setBind() {}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
