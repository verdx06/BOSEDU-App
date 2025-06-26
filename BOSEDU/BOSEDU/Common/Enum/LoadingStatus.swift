//
//  LoadingStatus.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 26.06.2025.
//

import Foundation

enum LoadingStatus: Equatable {
    case idle
    case loading
    case success
    case failure(String)

    var isLoading: Bool {
        if case .loading = self {
            return true
        }
        return false
    }
    
    var failureText: String {
        if case .failure(let message) = self {
            return message
        }
        return ""
    }
    
}
