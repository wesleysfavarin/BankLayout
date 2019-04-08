//
//  HomeCoordinator.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import Foundation
 class HomeCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
   
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let viewControllerFactory: ViewControllerFactory
    
    // MARK: - Private methods
    
    private func showHomeViewController() {
        let aVC = self.viewControllerFactory.instantiateHomeViewController()
        aVC.onGoToB = { [unowned self] in
            print("passous")
            self.showCartoesViewController()
        }

        self.router.setRootModule(aVC, hideBar: false)
    }
    
    private func showCartoesViewController() {
        let cartoes = self.viewControllerFactory.instantiateCartoesViewController()
        cartoes.onBack = { [unowned self] in
            self.router.popModule()
        }
        
        self.router.push(cartoes)
    }

    // MARK: - Coordinator
    
    override func start() {
        self.showHomeViewController()
    }
    
    // MARK: - Init
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
    }
    
    
}
