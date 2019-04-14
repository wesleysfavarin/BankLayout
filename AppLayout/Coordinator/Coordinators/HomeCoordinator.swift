//
//  HomeCoordinator.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import Foundation
 class HomeCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
   /// CoordinatorFinishOutput
    // MARK: - CoordinatorFinishOutput
    var finishFlow: (() -> Void)?
    
    /// Vars & Lets
    // MARK: - Vars & Lets
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let viewControllerFactory: ViewControllerFactory
    
    /// Navegação para home
    // MARK: - Private methods
    private func showHomeViewController() {
        let aVC = self.viewControllerFactory.instantiateHomeViewController()
        aVC.onGoToB = { [unowned self] in
            print("passous")
            self.showCartoesViewController()
        }

        self.router.setRootModule(aVC, hideBar: false)
    }
    
    /// Método com historico de navegação, com ele você consegue mudar de telas usando  coordinatos
    private func showCartoesViewController() {
        let cartoes = self.viewControllerFactory.instantiateCartoesViewController()
        cartoes.onBack = { [unowned self] in
            self.router.popModule()
        }
        
        self.router.push(cartoes)
    }

    /// Essa função é chamada pelo root, no qual definimos no app delegate
    // MARK: - Coordinator
    override func start() {
        self.showHomeViewController()
    }
    
    /// Init Coordinator Home
    // MARK: - Init
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
    }
    
    
}
