//
//  NetworkService.swift
//  NetworkService
//
//  Created by Виталий Багаутдинов on 22.06.2025.
//

import Foundation
import Alamofire

public protocol BaseNetworkService {
    func execute<T: Decodable>(endpoint: Constants.Path, method: HTTPMethod, parametars: Parameters?, token: String?) async throws -> T
    func configure(baseURL: String)
}

extension BaseNetworkService {
    func execute<T: Decodable>(endpoint: Constants.Path, method: HTTPMethod, parametars: Parameters?) async throws -> T {
        try await execute(endpoint: endpoint, method: method, parametars: parametars, token: nil)
    }
}

public final class BaseNetworkServiceImpl: BaseNetworkService {
    
    public var baseURL: String?
    
    public init(baseURL: String?) {
        self.baseURL = baseURL
    }
    
    private func headers(token: String) -> HTTPHeaders {
        return [
            .contentType("application/json"),
            .accept( "application/json"),
            .authorization(bearerToken: token)
        ]
    }
    
    public func execute<T: Decodable>(endpoint: Constants.Path, method: HTTPMethod, parametars: Parameters?, token: String? = "") async throws -> T {
        guard let baseURL = self.baseURL, let url = URL(string: baseURL + endpoint.rawValue) else {
            fatalError("Base URL is not valid")
        }
        
        /// запрос
        let result = try await AF.request(url, method: method, parameters: parametars, encoding: JSONEncoding.default, headers: headers(token: token ?? "")).serializingData().value
        
        return try JSONDecoder().decode(T.self, from: result)
        
    }
    
    public func configure(baseURL: String) {
        self.baseURL = baseURL
    }
    
        
    
    
}
