//
//  AuthRepository.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 23.06.2025.
//

import Foundation
import NetworkService

protocol AuthRepository {
    func register(email: String, password: String, name: String) async throws -> UserInfoModel
    func login(email: String, password: String) async throws -> LoginModel
    func sendEmailCode(email: String, code: String) async throws
}

final class AuthRepositoryImpl: AuthRepository {
    
    let networkRequest: NetworkRequests
    
    init(networkRequest: NetworkRequests) {
        self.networkRequest = networkRequest
    }
     
    func register(email: String, password: String, name: String) async throws -> UserInfoModel {
        let result = try await networkRequest.register(email: email, password: password, name: name)
        return UserInfoModel.convert(model: result)
    }
    
    func login(email: String, password: String) async throws -> LoginModel {
        let result = try await networkRequest.login(email: email, password: password)
        UserDefaults.standard.set(result.accessToken, forKey: "token")
        return LoginModel.convert(from: result)
    }
    
    func sendEmailCode(email: String, code: String) async throws {
        UserDefaults.standard.set(code, forKey: "codeForResend")
        try await networkRequest.sendCode(email: email, code: code)
    }
    
}
