//
//  SplashScreenUseCase.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 30.05.2025.
//

import Foundation

protocol OnboardingUseCase {
    func getLastWatchedScreenId() -> Int?
    func saveLastWatchedScreen(id: Int)
}

final class OnboardingUseCaseImpl: OnboardingUseCase {
    
    private let storage: OnboardingProgressStorage
    
    init(storage: OnboardingProgressStorage) {
        self.storage = storage
    }
    
    func getLastWatchedScreenId() -> Int? {
        storage.getLastWatchedScreenId()
    }
    
    func saveLastWatchedScreen(id: Int) {
        storage.setLastWatchedScreenId(id)
    }
}
