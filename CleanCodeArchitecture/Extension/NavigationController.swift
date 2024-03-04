//
//  NavigationController.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 02/03/24.
//

import Foundation
import UIKit

extension UINavigationController {
    public func pushViewController(with nav: UINavigationController, nav view: UIViewController){
        let vc = view
        nav.pushViewController(vc, animated: true)
    }
}
