//
//  HomeViewController.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import UIKit

protocol HomeViewControllerProtocol: BaseViewControllerProtocol {
    var onGoToB: (() -> Void)? { get set }
    var onGoToProfile: (() -> Void)? { get set }
    
}

class HomeViewController: UIViewController, HomeViewControllerProtocol {
    var onGoToB: (() -> Void)?
    
    var onGoToProfile: (() -> Void)?
    
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
    }
    

    @IBAction func onGoToCartoes(_ sender: Any) {
        self.onGoToB?()
    }
}
