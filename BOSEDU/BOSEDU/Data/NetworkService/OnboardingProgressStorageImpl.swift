//
//  OnboardingProgressStorageImpl.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 09.08.2025.
//

import Foundation

public protocol OnboardingProgressStorage {
    func getLastWatchedScreenId() -> Int?
    func setLastWatchedScreenId(_ id: Int)
}


final class OnboardingProgressStorageImpl: OnboardingProgressStorage {
    
    private let defaults: UserDefaults
    private let key = "screen"
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    func getLastWatchedScreenId() -> Int? {
        return defaults.object(forKey: key) as? Int
    }
    
    func setLastWatchedScreenId(_ id: Int) {
        defaults.set(id, forKey: key)
    }
}
