//
//  NetworkService.swift
//  NetworkService
//
//  Created by Виталий Багаутдинов on 22.06.2025.
//

import Foundation
import Alamofire

public protocol BaseNetworkService {
    func execute<T: Decodable>(endpoint: Constants.Path, method: HTTPMethod, parameters: Parameters?, token: String?) async throws -> T
    func configure(baseURL: String)
}

extension BaseNetworkService {
    func execute<T: Decodable>(endpoint: Constants.Path, method: HTTPMethod, parameters: Parameters?) async throws -> T {
        try await execute(endpoint: endpoint, method: method, parameters: parameters, token: nil)
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
    
    public func execute<T: Decodable>(endpoint: Constants.Path, method: HTTPMethod, parameters: Parameters?, token: String? = "") async throws -> T {
        guard let baseURL = self.baseURL,
              let url = URL(string: baseURL + endpoint.rawValue) else {
            throw NetworkError.invalidURL
        }
        
        do {
            let request = AF.request(
                url,
                method: method,
                parameters: parameters,
                encoding: JSONEncoding.default,
                headers: headers(token: token ?? "")
            )
            
            let response = await request.serializingData().response
            
            // Проверяем статус код
            guard let httpResponse = response.response else {
                throw NetworkError.noResponse
            }
            
            guard let data = response.data else {
                throw NetworkError.serverError(message: ServerErrorResponse(detail: "No data received"))
            }
            
            switch httpResponse.statusCode {
            case 200...299:
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    throw NetworkError.decodingError(error.localizedDescription)
                }
                
            default:
                    do {
                        let serverError = try JSONDecoder().decode(ServerErrorResponse.self, from: data)
                        throw NetworkError.serverError(message: serverError)
                    } catch {
                        if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                           let detail = json["detail"] as? String {
                            throw NetworkError.serverError(message: ServerErrorResponse(detail: detail))
                        } else if let errorText = String(data: data, encoding: .utf8), !errorText.isEmpty {
                            throw NetworkError.serverError(message: ServerErrorResponse(detail: errorText))
                        } else {
                            throw NetworkError.serverError(message: ServerErrorResponse(
                                detail: "Ошибка сервера: \(httpResponse.statusCode)"
                            ))
                        }
                    }
            }
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.unknownError(error.localizedDescription)
        }
    }
    
    public func configure(baseURL: String) {
        self.baseURL = baseURL
    }
}
