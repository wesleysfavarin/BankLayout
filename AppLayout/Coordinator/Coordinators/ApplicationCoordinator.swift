//
//  ApplicationCoordinator.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import Foundation
class ApplicationCoordinator: BaseCoordinator {
    
    // MARK: - Vars & Lets
    
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let router: RouterProtocol
    private var launchInstructor = LaunchInstructor.configure()
    private let viewControllerFactory: ViewControllerFactory = ViewControllerFactory()
    
    // MARK: - Coordinator
    
    override func start(with option: DeepLinkOption?) {
        if option != nil {
            
        } else {
            switch launchInstructor {
            case .home: runHomeFlow()
            case .auth: runAFlow()
            case .main: runMainFlow()
            case .cartoes: runMainFlow()
            }
        }
    }
    
    // MARK: - Private methods
    
    private func runAFlow() {
        let coordinator = self.coordinatorFactory.makeAuthCoordinatorBox(router: self.router, coordinatorFactory: self.coordinatorFactory, viewControllerFactory: self.viewControllerFactory)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.launchInstructor = LaunchInstructor.configure(tutorialWasShown: false, isAutorized: true)
            self.start()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
    //Altera o login pelo home que passa ser a coordinaor mae
   private func runHomeFlow() {
    let coordinator = self.coordinatorFactory.makeHomeCoordinatorBox(router: self.router, coordinatorFactory: self.coordinatorFactory, viewControllerFactory: self.viewControllerFactory)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
        self.removeDependency(coordinator)
        self.launchInstructor = LaunchInstructor.configure(tutorialWasShown: false, isAutorized: true)
        self.start()
    }
    self.addDependency(coordinator)
    coordinator.start()
    }
    
    
    private func runCartoesFlow() {
//               let coordinator = self.coordinatorFactory.makeCartoesCoordinatorBox(router: self.router, viewControllerFactory: ViewControllerFactory())
//                coordinator.finishFlow = { [unowned self, unowned coordinator] in
//                    self.removeDependency(coordinator)
//                    self.launchInstructor = LaunchInstructor.configure(tutorialWasShown: true, isAutorized: true)
//                    self.start()
//                }
//                self.addDependency(coordinator)
//                coordinator.start()
    }
    
    private func runMainFlow() {
//        let coordinator = self.coordinatorFactory.makeMainCoordinatorBox(router: self.router, coordinatorFactory: CoordinatorFactory(), viewControllerFactory: ViewControllerFactory())
//        coordinator.finishFlow = { [unowned self, unowned coordinator] in
//            self.removeDependency(coordinator)
//            self.launchInstructor = LaunchInstructor.configure(tutorialWasShown: false, isAutorized: false)
//            self.start()
//        }
//        self.addDependency(coordinator)
//        coordinator.start()
    }
    
    // MARK: - Init
  
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
}
