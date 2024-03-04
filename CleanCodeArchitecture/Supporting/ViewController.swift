//
//  ViewController.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 28/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    var data: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        startFetch()
    }
    
    func startFetch(){
        guard let url = URL(string: "https://api.github.com/users/vickyir") else {
            return
        }
        Task {
            do {
                self.data = try await ApiCaller.shared.getData(for: Model.self, from: url)
                guard let result = data else {
                    return
                }
                print(result.avatar_url)
            } catch CustomError.responseError{
                print("response error")
            } catch CustomError.dataError {
                print("data error")
            } catch {
                // Handle error
                print("Error fetching data: \(error)")
            }
        }
        
    }
    
}

enum CustomError: Error {
    case wrongUrl
    case responseError
    case dataError
}

struct Model: Codable {
    var login: String
    var avatar_url: String
}

class ApiCaller {
    static let shared = ApiCaller()
    
    func getData<T: Decodable>(for: T.Type, from url: URL) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw CustomError.responseError
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        }catch{
            throw CustomError.dataError
        }
    }
}

