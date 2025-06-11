//
//  SplashScreenUseCase.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 30.05.2025.
//

import Foundation

protocol SplashScreenUseCase {
    func startSplashTimer() async throws
}

final class SplashScreenUseCaseImpl: SplashScreenUseCase {
    
    func startSplashTimer() async throws {
        try await Task.sleep(for: .seconds(2))
    }
    
}
