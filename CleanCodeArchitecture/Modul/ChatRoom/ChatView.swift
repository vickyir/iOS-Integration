//
//  ChatView.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 06/03/24.
//

import Foundation
import UIKit

class ChatViewController: UIViewController, PTVChatProtocol {
    var presenter: PTPChatProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Place ur code here
        view.backgroundColor = .blue
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}
