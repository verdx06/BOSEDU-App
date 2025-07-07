//
//  LoginModel.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 03.07.2025.
//

import Foundation
import NetworkService

struct LoginModel: Decodable {
    let accessToken: String
    let tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
}

extension LoginModel {
    static func convert(from decoder: TokenResponseModel) -> LoginModel {
        return LoginModel(accessToken: decoder.accessToken, tokenType: decoder.tokenType)
    }
}
