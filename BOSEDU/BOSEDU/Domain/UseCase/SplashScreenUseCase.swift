//
//  SplashScreenUseCase.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 30.05.2025.
//

import Foundation

protocol SplashScreenUseCase {
    func startSplashTimer() async throws
    func isOnboardingShown() async throws -> Bool
}

final class SplashScreenUseCaseImpl: SplashScreenUseCase {
    
    let repository: SplashRepository
    
    init(repository: SplashRepository) {
        self.repository = repository
    }
    
    func startSplashTimer() async throws {
        try await Task.sleep(for: .seconds(2))
    }
    
    func isOnboardingShown() async throws -> Bool {
        return try await repository.isOnboardingShown()
    }
    
}
