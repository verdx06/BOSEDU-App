//
//  LoginResponseModel.swift
//  NetworkService
//
//  Created by Виталий Багаутдинов on 26.06.2025.
//


import Foundation

//"access_token": "string",
//"token_type": "string"

public struct TokenResponseModel: Decodable {
    public let accessToken: String
    public let tokenType: String
    
    public enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
    
}
