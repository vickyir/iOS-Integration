//
//  ChatProtocol.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 06/03/24.
//

import Foundation
import UIKit

protocol PTVChatProtocol: AnyObject {
    var presenter: PTPChatProtocol? {get set}
}

protocol PTIChatProtocol: AnyObject {
    var presenter: PTPChatProtocol? {get set}
}

protocol PTPChatProtocol: AnyObject {
    var view: PTVChatProtocol? {get set}
    var interactor: PTIChatProtocol? {get set}
    var router: PTRChatProtocol? {get set}
}

typealias entryChat = PTVChatProtocol & UIViewController
protocol PTRChatProtocol: AnyObject {
    var entry: entryChat? {get set}
    
    static func entryChat() -> PTRChatProtocol
}
