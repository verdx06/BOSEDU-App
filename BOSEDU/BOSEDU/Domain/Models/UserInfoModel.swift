//
//  UserInfoModel.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 26.06.2025.
//


import Foundation
import NetworkService

struct UserInfoModel: Decodable {
    
    let id: Int
    let email: String
    let name: String
    let photo_url: String
    
}

extension UserInfoModel {
    
    static func convert(model: UserInfoResponseModel) -> UserInfoModel {
        return UserInfoModel(id: model.id, email: model.email, name: model.name, photo_url: model.photo_url)
    }
    
}
