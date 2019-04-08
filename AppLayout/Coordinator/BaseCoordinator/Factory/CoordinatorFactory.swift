//
//  CoordinatorFactory.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import Foundation
protocol CoordinatorFactoryProtocol {
   func makeAuthCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> AuthCoordinator
    
        func makeHomeCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> HomeCoordinator
    
//    func makeMainCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> MainCoordinator
//    func makeWalktroughCoordinatorBox(router: RouterProtocol, viewControllerFactory: ViewControllerFactory) -> WalktroughCoordinator
    func makeCartoesCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> CartoesCoordinator
}

class CoordinatorFactory: CoordinatorFactoryProtocol {
   
    
    // MARK: - CoordinatorFactoryProtocol
    
    func makeAuthCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> AuthCoordinator {
        let coordinator = AuthCoordinator(router: router, coordinatorFactory: coordinatorFactory, viewControllerFactory: viewControllerFactory)
       return coordinator
  }
   
    
    func makeHomeCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> HomeCoordinator {
        let coordinator = HomeCoordinator(router: router, coordinatorFactory: coordinatorFactory, viewControllerFactory: viewControllerFactory)
        return coordinator
    }
   
    
    func makeCartoesCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> CartoesCoordinator {
        let coordinator = CartoesCoordinator(router: router, coordinatorFactory: coordinatorFactory, viewControllerFactory: viewControllerFactory)
        return coordinator
    }
    
}
