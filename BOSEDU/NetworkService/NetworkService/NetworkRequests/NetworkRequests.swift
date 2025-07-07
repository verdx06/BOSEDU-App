//
//  NetworkRequests.swift
//  NetworkService
//
//  Created by Виталий Багаутдинов on 23.06.2025.
//

import Foundation

public protocol NetworkRequests {
    func register(email: String, password: String, name: String) async throws -> UserInfoResponseModel
    func login(email: String, password: String) async throws -> TokenResponseModel
}

public final class NetworkRequestsImpl: NetworkRequests {
    
    let request: BaseNetworkService = BaseNetworkServiceImpl(baseURL: Constants.baseURLString)
    
    public init () {}
    
    public func register(email: String, password: String, name: String) async throws -> UserInfoResponseModel {
        let result: UserInfoResponseModel = try await request.execute(endpoint: .users, method: .post, parameters: [
            "email": email,
            "name": name,
            "photo_url": "",
            "password": password
        ])
        
        return result
        
    }
    
    public func login(email: String, password: String) async throws -> TokenResponseModel {
        let result: TokenResponseModel = try await request.execute(endpoint: .login, method: .post, parameters: [
            "email": email,
            "password": password
        ])
        
        return result
        
    }
    
    
}
