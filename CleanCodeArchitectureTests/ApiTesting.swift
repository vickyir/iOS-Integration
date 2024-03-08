//
//  ApiTesting.swift
//  CleanCodeArchitectureTests
//
//  Created by Vicky Irwanto on 29/02/24.
//

import XCTest
@testable import CleanCodeArchitecture

final class ApiTesting: XCTestCase {
    
    func testSuccessGetFollowers() async throws {
        let url = "users/vickyir/followers"
        let network = Api.shared
        
        do{
            let fetch = try await network.getData(for: [UserFollowers].self, from: url)
            XCTAssertNotNil(fetch)
        }catch{
            XCTFail("failed to test data \(error)")
        }
    }
    
    func testSuccessGetUserDetail() async throws {
        let url = "users/vickyir"
        let network = Api.shared
        
        do{
            let fetch = try await network.getData(for: UserFollowers.self, from: url)
            XCTAssertNotNil(fetch)
        }catch{
            XCTFail("error to fetch : \(error)")
        }
    }
    
    func testAlomofireFetchingData() async throws {
        let url = "users/vickyir"
        let network = Api.shared
        
        do{
            let fetch = try await network.getDataAF(for: UserFollowers.self, from: url)
            XCTAssertNotNil(fetch)
        }catch{
            XCTFail("error to fetch : \(error)")
        }
    }
    
    func testRegisterUserFirebase() {
        let user = RegisterUser(username: "vicky", email: "reyhan@gmail.com", password: "123456")
        
        AuthService.shared.registerUser(from: user) { isCompleted, error in
            if let error = error {
                XCTFail("error: \(error)")
                return
            }else{
                XCTAssertTrue(isCompleted)
            }
            
        }
        
    }
    
    func testGetData() async  {
        let url = "http://localhost:3000/api/users/getAllUsers"
        let network = Api.shared
        
        do{
            let fetch = try await network.getDataWithBearerToken(with: url)
            print("ini adalah : \(fetch.error)")
            print(fetch.message)
            XCTAssertNotNil(fetch)
        }catch{
            XCTFail("error : \(error.localizedDescription)")
        }
    }
    
}
