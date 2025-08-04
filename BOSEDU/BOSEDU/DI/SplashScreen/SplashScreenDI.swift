//
//  SplashScreenDI.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 30.05.2025.
//

import Foundation

final class SplashScreenDI {
    
    @MainActor
    static func make() -> SplashScreenViewModel {
        let repository: SplashRepository = SplashRepositoryImpl()
        let useCase: SplashScreenUseCase = SplashScreenUseCaseImpl(repository: repository)
        return SplashScreenViewModel(useCase: useCase)
    }
    
}
