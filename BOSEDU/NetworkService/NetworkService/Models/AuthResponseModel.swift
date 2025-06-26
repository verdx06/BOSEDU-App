//
//  AuthResponseModel.swift
//  NetworkService
//
//  Created by Виталий Багаутдинов on 26.06.2025.
//

import Foundation

//{
//  "email": "string",
//  "name": "string",
//  "photo_url": "string",
//  "id": 0,
//  "created_at": "2025-06-26T04:15:05.501Z"
//}

public struct UserInfoResponseModel: Decodable {
    
   public  let id: Int
   public  let email: String
   public  let name: String
   public  let photoUrl: String
    
    
}
