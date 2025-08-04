//
//  SplashRepository.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 08.07.2025.
//

import Foundation

protocol SplashRepository {
    func isOnboardingShown() async throws -> Bool
}

final class SplashRepositoryImpl: SplashRepository {
    
    func isOnboardingShown() async throws -> Bool {
        return UserDefaults.standard.object(forKey: "screen") as? Int ?? 0 <= 4
    }
    
    
}
