//
//  CartoesViewController.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import UIKit

protocol CartoesViewControllerProtocol: class {
    var onBack: (() -> Void)? { get set }
    var onCartoes: (() -> Void)? { get set }
}

protocol CartoesViewControllerDelegate: class {
    func didSelectDate(date: Date)
}

class CartoesViewController: UIViewController,CartoesViewControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var onBack: (() -> Void)?
    var onCartoes: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: CartoesViewModelProtocol?
   

}
