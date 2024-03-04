//
//  Api.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 28/02/24.
//

import Foundation
import Alamofire


enum MyError: Error{
    case urlError
    case responseError
    case dataError
}


class Api {
    static let shared = Api()
    let baseUrl = "https://api.github.com/"
    
    
    func getData<T: Decodable>(for: T.Type, from url: String) async throws -> T {
        guard let url = URL(string: "\(baseUrl)\(url)") else{
            throw MyError.urlError
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw MyError.responseError
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        }catch{
            throw MyError.dataError
        }
    }
    
    func getDataAF<T: Decodable>(for: T.Type, from url: String)async throws -> T {
        guard let url = URL(string: "\(baseUrl)\(url)") else {
            throw MyError.urlError
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
                .response { resp in
                    switch resp.result {
                    case .success(let data):
                        do {
                            guard let data = data else {
                                throw MyError.dataError
                            }
                            let jsonData = try JSONDecoder().decode(T.self, from: data)
                            continuation.resume(returning: jsonData)
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    case .failure(let failure):
                        continuation.resume(throwing: failure)
                    }
                }
        }
        
    }
    
    func getDataNoConcurency(completion: @escaping(Result<[UserFollowers], Error>)-> Void){
        
        let url = "\(baseUrl)users/vickyir/followers"
        
        guard let apiUrl = URL(string: url) else{
            return
        }
        
        let data = URLSession.shared.dataTask(with: apiUrl) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completion(.failure(MyError.responseError))
                return
            }
            
            if let data = data {
                do{
                    let decoder = JSONDecoder()
                    let finalData = try decoder.decode([UserFollowers].self, from: data)
                    completion(.success(finalData))
                }catch{
                    completion(.failure(error))
                }
            }
        }
        
        data.resume()
        
    }
    
    
    func postData<T: Codable>(data: T, from url: String) async throws -> T {
        
        guard let url = URL(string: url) else {
            throw MyError.urlError
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        
        do {
            request.httpBody = try encoder.encode(data)
        }catch{
            throw MyError.dataError
        }
        
        // Set the content type to application/json
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (responseData, responseHttp) = try await URLSession.shared.data(for: request)
        
        guard let response = responseHttp as? HTTPURLResponse, response.statusCode == 200 else{
            throw MyError.responseError
        }
        
        print(responseData)
        
        do{
            let data = try JSONDecoder().decode(T.self, from: responseData)
            return data
        }catch{
            throw error
        }
        
        
    }
    
    func loginUser(data: loginApi, completion: @escaping (Result<ResponseLogin, Error>)-> Void){
        let baseUrl = "http://localhost:3000/api/users/login"
        
        guard let url = URL(string: baseUrl) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        
        do{
            request.httpBody = try encoder.encode(data)
        }catch{
            completion(.failure(error))
        }
        
        // Set the content type to application/json
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let data = URLSession.shared.dataTask(with: request){dataResponse, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completion(.failure(MyError.responseError))
                return
            }
            
            do{
                guard let data = dataResponse else{
                    return
                }
                let response = try JSONDecoder().decode(ResponseLogin.self, from: data)
                completion(.success(response))
            }catch{
                completion(.failure(error))
            }
            
        }
        
        data.resume()
    }
    
    func loginUserAsync(data: loginApi) async throws -> ResponseLogin {
        let baseUrl = "http://localhost:3000/api/users/login"
        
        guard let url = URL(string: baseUrl) else {
            throw MyError.urlError
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(data)
        
        // Set the content type to application/json
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (responseData, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MyError.responseError
        }
        
        let decodedResponse = try JSONDecoder().decode(ResponseLogin.self, from: responseData)
        return decodedResponse
    }
    
}
