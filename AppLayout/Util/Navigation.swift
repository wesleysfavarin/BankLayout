//
//  SegmentioSetup.swift
//  AppLayout
//
//  Created by mac on 13/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import UIKit
struct System {
    static func clearNavigationBar(forBar navBar: UINavigationBar) {
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
    }
}
