//
//  Coordinator.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import Foundation
import Foundation
protocol Coordinator: class {
    func start()
    func start(with option: DeepLinkOption?)
}
