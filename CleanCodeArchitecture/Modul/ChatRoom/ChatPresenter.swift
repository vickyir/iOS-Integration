//
//  ChatPresenter.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 06/03/24.
//

import Foundation


class ChatPresenter: PTPChatProtocol {
    var view: PTVChatProtocol?
    
    var interactor: PTIChatProtocol?
    
    var router: PTRChatProtocol?
    
    
}
