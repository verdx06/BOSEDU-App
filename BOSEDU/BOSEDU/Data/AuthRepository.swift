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
    func login(email: String, password: String) async throws
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
    
    func login(email: String, password: String) async throws {
        let result = try await networkRequest.login(email: email, password: password)
    }
    
    
}
