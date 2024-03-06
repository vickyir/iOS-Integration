//
//  ChatRouter.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 06/03/24.
//

import Foundation
import UIKit


class ChatRouter: PTRChatProtocol {
    var entry: entryChat?
    
    static func entryChat() -> PTRChatProtocol {
        let router = ChatRouter()
        
        let view = ChatViewController()
        let interactor = ChatInteractor()
        let presenter = ChatPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view
        
        return router
    }
    
    
}
