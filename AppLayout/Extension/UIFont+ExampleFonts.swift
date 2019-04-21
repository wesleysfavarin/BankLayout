//
//  UIFont+ExampleFonts.swift
//  AppLayout
//
//  Created by mac on 20/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import UIKit

extension UIFont {
    class func exampleAvenirMedium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Book", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    class func exampleAvenirLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
