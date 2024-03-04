//
//  Alert.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 02/03/24.
//

import Foundation
import UIKit


extension UIViewController {
    public func baseAlert(){
        let alert = UIAlertController(title: "Sorry :(", message: "please check the field", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
    
    public func registerAlert(with msg: String){
        let alert = UIAlertController(title: "Sorry :(", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cokk !!", style: .cancel))
        present(alert, animated: true)
    }
}
