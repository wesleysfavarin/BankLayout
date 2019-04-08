//
//  LaunchInstructor.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import Foundation

fileprivate var onboardingWasShown = false
fileprivate var isAutorized = false

enum LaunchInstructor {
    
    case main
    case auth
    case home
    case cartoes
    
    // MARK: - Public methods
    
    static func configure( tutorialWasShown: Bool = onboardingWasShown, isAutorized: Bool = isAutorized) -> LaunchInstructor {
        
        switch (tutorialWasShown, isAutorized) {
        case (true, false), (false, false): return .auth
        case (false, true): return .home
        case (true, true): return .main
        case (true, true): return .cartoes
        }
    }
}
