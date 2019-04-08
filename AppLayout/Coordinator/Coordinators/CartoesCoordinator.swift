//
//  CartoesCoordinator.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import Foundation
class CartoesCoordinator:  BaseCoordinator, CoordinatorFinishOutput {
    var finishFlow: (() -> Void)?
    
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let viewControllerFactory: ViewControllerFactory
    
    
    private func showCartoesViewController() {
        let cartoesVC = self.viewControllerFactory.instantiateCartoesViewController()
        cartoesVC.onBack = { [unowned self] in
            self.router.popModule()
        }
        self.router.push(cartoesVC)
    }
    
    override func start() {
        self.showCartoesViewController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
    }
}
