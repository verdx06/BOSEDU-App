//
//  Constants.swift
//  NetworkService
//
//  Created by Виталий Багаутдинов on 23.06.2025.
//

import Foundation

public struct Constants {
    static let baseURLString = "http://localhost:8000"
    
    public enum Path: String {
        case users = "/users/"
        case news = "/news/"
        case events = "/events/"
        case advertisements = "/advertisements/"
        case login = "/token/"
    }
    
}
