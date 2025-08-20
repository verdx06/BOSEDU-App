//
//  OnboardingProgressStorage.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 09.08.2025.
//

import Foundation

public protocol OnboardingProgressStorage {
    func getLastWatchedScreenId() -> Int?
    func setLastWatchedScreenId(_ id: Int)
}
