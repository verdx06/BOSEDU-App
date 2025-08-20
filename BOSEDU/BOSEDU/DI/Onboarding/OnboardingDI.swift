//
//  OnboardingDI.swift
//  BOSEDU
//
//  Created by AI on 09.08.2025.
//

import Foundation

final class OnboardingDI {
    static func make() -> OnboardingViewModel {
        let storage: OnboardingProgressStorage = OnboardingProgressStorageImpl()
        let useCase: OnboardingUseCase = OnboardingUseCaseImpl(storage: storage)
        return OnboardingViewModel(useCase: useCase)
    }
}
