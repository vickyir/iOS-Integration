//
//  ModulInteractor.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 28/02/24.
//

import Foundation

class ModulInteractor: PTIModulInteractorProtocol {
    
    var presenter: PTPModulPresenterProtocol?
    
    func getUserDetail() async{
        
        do{
            let url = "users/vickyir"
            let data = try await Api.shared.getData(for: UserFollowers.self, from: url)
            self.presenter?.didFinishGetUserDetail(completion: .success(data))
        }catch{
            self.presenter?.didFinishGetUserDetail(completion: .failure(error))
        }
        
    }
    
    func getUserFollower() async{
        
        do{
            let url = "users/vickyir/followers"
            let data = try await Api.shared.getDataAF(for: [UserFollowers].self, from: url)
            self.presenter?.didFinishGetUserFollower(completion: .success(data))
        }catch MyError.urlError {
            self.presenter?.didFinishGetUserFollower(completion: .failure(MyError.urlError))
        }catch MyError.responseError {
            self.presenter?.didFinishGetUserFollower(completion: .failure(MyError.responseError))
        }catch MyError.dataError {
            self.presenter?.didFinishGetUserFollower(completion: .failure(MyError.dataError))
        }catch{
            self.presenter?.didFinishGetUserFollower(completion: .failure(error))
        }
        
    }
    
}
