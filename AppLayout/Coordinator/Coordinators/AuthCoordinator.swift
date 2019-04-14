//
//  AuthCoordinator.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//
///Classe coordinator do login
import Foundation
class AuthCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    var finishFlow: (() -> Void)?
    
    ///Váriaveis privadas
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let viewControllerFactory: ViewControllerFactory
    
    ///Métodos privados
    // MARK: - Private methods
    private func goToLoginViewController() {
        let loginVC = self.viewControllerFactory.instantiateLoginViewController()
        loginVC.onLogin = { [unowned self] in
            self.finishFlow?()
            
        }

        self.router.setRootModule(loginVC, hideBar: true)
    }
    /// Inicio da navegacao
    // MARK: - Coordinator
    override func start() {
        self.goToLoginViewController()
    }
    
    // MARK: - Init
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
    }
    
}
