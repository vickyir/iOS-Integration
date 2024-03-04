//
//  ModulProtocol.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 28/02/24.
//

import Foundation
import UIKit

protocol PTVModulViewProtocol: AnyObject {
    var presenter: PTPModulPresenterProtocol? {get set}
    
    func getDataSucces(with data: [UserFollowers])
    func getDataFail(with error: String)
    func getUserDetail(with data: UserFollowers)
}

protocol PTPModulPresenterProtocol: AnyObject {
    var view: PTVModulViewProtocol? {get set}
    var interactor: PTIModulInteractorProtocol? {get set}
    var router: PTRModuleRouterProtocol? {get set}
    
    func didFinishGetUserDetail(completion result: Result<UserFollowers, Error>)
    func didFinishGetUserFollower(completion result: Result<[UserFollowers], Error>)
}

protocol PTIModulInteractorProtocol: AnyObject {
    var presenter: PTPModulPresenterProtocol? {get set}
    
    func getUserDetail() async
    func getUserFollower() async
}

typealias entryPoint = PTVModulViewProtocol & UIViewController
protocol PTRModuleRouterProtocol: AnyObject {
    var entry: entryPoint? {get set}
    static func startEntry() -> PTRModuleRouterProtocol
}
