//
//  UIStoryboard.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    // MARK: - Vars & Lets
    
    static var home: UIStoryboard {
        return UIStoryboard.init(name: "Home", bundle: nil)
    }
    
    static var auth: UIStoryboard {
        return UIStoryboard.init(name: "Auth", bundle: nil)
    }
    
    static var cartoes: UIStoryboard {
        return UIStoryboard.init(name: "Cartoes", bundle: nil)
    }
    
    static var walktrough: UIStoryboard {
        return UIStoryboard.init(name: "Walktrough", bundle: nil)
    }
    
    static var profile: UIStoryboard {
        return UIStoryboard.init(name: "Profile", bundle: nil)
    }
    
}
