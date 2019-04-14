//
//  CartoesCoordinator.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//
/// CartoesCoordinator
import Foundation
class CartoesCoordinator:  BaseCoordinator, CoordinatorFinishOutput {
    var finishFlow: (() -> Void)?
    
    
    /// Vaiaveis privadas
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let viewControllerFactory: ViewControllerFactory
    
    /// Executa navegaçao para a tela de cartões
    private func showCartoesViewController() {
        let cartoesVC = self.viewControllerFactory.instantiateCartoesViewController()
        cartoesVC.onBack = { [unowned self] in
            self.router.popModule()
        }
        self.router.push(cartoesVC)
    }
    
    /// Método chamado pela home
    override func start() {
        self.showCartoesViewController()
    }
    
    /// Init coordinator cartoes
    // MARK: - Init
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
    }
}
