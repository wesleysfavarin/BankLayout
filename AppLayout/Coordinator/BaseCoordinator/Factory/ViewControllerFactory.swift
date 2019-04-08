//
//  ViewControllerFactory.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import UIKit
class ViewControllerFactory {
    
    func instantiateLoginViewController() -> AuthViewController {
        let loginVC = UIStoryboard.auth.instantiateViewController(withIdentifier: "AuthViewController") as! AuthViewController
        loginVC.viewModel = AuthViewModel()
        return loginVC
    }
    
    func instantiateHomeViewController() -> HomeViewController {
    let home = UIStoryboard.home.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    home.viewModel = HomeViewModel()
    return home
    }
    
    func instantiateCartoesViewController() -> CartoesViewController {
        let cartoes = UIStoryboard.cartoes.instantiateViewController(withIdentifier: "CartoesViewController") as! CartoesViewController
        cartoes.viewModel = CartoesViewModel()
        return cartoes
    }

}
