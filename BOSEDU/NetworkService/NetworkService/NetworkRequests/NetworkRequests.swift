//
//  NetworkRequests.swift
//  NetworkService
//
//  Created by Виталий Багаутдинов on 23.06.2025.
//

import Foundation

public protocol NetworkRequests {
    func register(email: String, password: String, name: String) async throws
    func login(email: String, password: String) async throws
}

public final class NetworkRequestsImpl: NetworkRequests {
    
    let request: BaseNetworkService = BaseNetworkServiceImpl(baseURL: Constants.baseURLString)
    
    public init () {}
    
    public func register(email: String, password: String, name: String) async throws {
        let result = try await request.execute(endpoint: .users, method: .post, parametars: [
            "email": name,
            "phone": "",
            "username": name,
            "photo_url": "",
            "password": password
        ], token: "")
        print(String(data: result, encoding: .utf8) ?? "")
    }
    
    public func login(email: String, password: String) async throws {
        let result = try await request.execute(endpoint: .token, method: .post, parametars: [
            "email": email,
            "password": password
        ], token: "")
    }
    
    
}
