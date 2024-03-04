//
//  ModulRouter.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 28/02/24.
//

import Foundation
import UIKit

class ModulRouter: PTRModuleRouterProtocol {
    var entry: entryPoint?
    
    static func startEntry() -> PTRModuleRouterProtocol {
        let router = ModulRouter()
        
        let view = ModulViewController()
        let presenter = ModulPresenter()
        let interactor = ModulInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        router.entry = view
        
        return router
    }
    
    
}
