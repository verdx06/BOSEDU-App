//
//  NetworkRequests.swift
//  NetworkService
//
//  Created by Виталий Багаутдинов on 23.06.2025.
//

import Foundation
import Alamofire

public protocol NetworkRequests {
    func register(email: String, password: String, name: String) async throws -> UserInfoResponseModel
    func login(email: String, password: String) async throws -> TokenResponseModel
    func sendCode(email: String, code: String) async throws
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
    
    public func sendCode(email: String, code: String) async throws {
        request.configure(baseURL: Constants.emailURLString)
        let result: CodeResponseModel = try await request.execute(endpoint: .email, method: .post, parameters: [
            "from": "onboarding@resend.dev",
            "to": email,
            "subject": "BOSEDU",
            "html": "<p>Ваш код для восстановления пароля: <strong>\(code)</strong></p><p>Если вы не запрашивали восстановление пароля, просто пропускайте это письмо.</p>"
        ], token: "re_XvWQyZNa_9bSYpTkVrPCpeSJvg97E3DUX")
        

        
    }
    
}
