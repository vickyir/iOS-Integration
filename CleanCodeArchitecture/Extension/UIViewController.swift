//
//  UIViewController.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 06/03/24.
//

import Foundation
import UIKit

extension UIViewController {
    public func dismissKeybord(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissKey))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func dismissKey(){
        self.view.endEditing(true)
    }
}
