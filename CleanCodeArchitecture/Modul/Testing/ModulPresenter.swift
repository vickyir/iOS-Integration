//
//  ModulPresenter.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 28/02/24.
//

import Foundation

class ModulPresenter: PTPModulPresenterProtocol {
    var view: PTVModulViewProtocol?
    
    var interactor: PTIModulInteractorProtocol? {
        didSet {
            Task{
                await interactor?.getUserFollower()
                await interactor?.getUserDetail()
            }
          
        }
    }
    
    var router: PTRModuleRouterProtocol?
    
    func didFinishGetUserDetail(completion result: Result<UserFollowers, Error>) {
        switch result {
        case .success(let success):
            view?.getUserDetail(with: success)
        case .failure(let failure):
            print("\(failure.localizedDescription)")
        }
    }
    
    func didFinishGetUserFollower(completion result: Result<[UserFollowers], Error>) {
        switch result {
        case .success(let success):
            view?.getDataSucces(with: success)
        case .failure(let error):
            view?.getDataFail(with: error.localizedDescription)
        }
    }
    
}
