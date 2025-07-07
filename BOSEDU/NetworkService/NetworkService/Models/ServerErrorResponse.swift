//
//  ServerErrorResponse.swift
//  NetworkService
//
//  Created by Виталий Багаутдинов on 26.06.2025.
//

import Foundation

public struct ServerErrorResponse: Decodable {
    public let detail: String
    
    public init(detail: String) {
        self.detail = detail
    }
}

public enum NetworkError: Error, LocalizedError {
    case invalidURL
    case noResponse
    case decodingError(String)
    case serverError(message: ServerErrorResponse)
    case unknownError(String)
    
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Неверный URL адрес"
        case .noResponse:
            return "Нет ответа от сервера"
        case .decodingError(let message):
            return "Ошибка обработки данных: \(message)"
        case .serverError(let message):
            return message.detail
        case .unknownError(let message):
            return "Неизвестная ошибка: \(message)"
        }
    }
}
