//
//  ModulEntity.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 28/02/24.
//

import Foundation

struct UserFollowers: Codable {
    var login: String
    var avatar_url: String
}

struct RegisterUser {
    let username: String
    let email: String
    let password: String
}

struct UserLogin {
    let email: String
    let password: String
}

struct loginApi: Codable {
    let user_email: String
    let user_password: String
}

struct ResponseLogin: Codable {
    let error: Bool
    let message: String
    let token: String
}

struct ResponseData: Codable {
    let error: Bool
    let message: String
}
