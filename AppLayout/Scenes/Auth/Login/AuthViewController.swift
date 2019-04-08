//
//  AuthViewController.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import UIKit

protocol AuthViewControllerProtocol: class {
    var onLogin: (() -> Void)? { get set }
    var onRegister: (() -> Void)? { get set }
    var onChangePassword: (() -> Void)? { get set }
    var onFinish: (() -> Void)? { get set }
}

class AuthViewController: UIViewController, AuthViewControllerProtocol {
    var onFinish: (() -> Void)?
    
    // MARK: - LoginViewControllerProtocol
    var onLogin: (() -> Void)?
    
    var onRegister: (() -> Void)?
    
    var onChangePassword: (() -> Void)?
    
    var viewModel: AuthViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Actions
    
    @IBAction func login() {
        self.onLogin?()
    }
    
    @IBAction func register() {
        self.onRegister?()
    }
    
    @IBAction func forgetPassword() {
        self.onChangePassword?()
    }
    

   

}
