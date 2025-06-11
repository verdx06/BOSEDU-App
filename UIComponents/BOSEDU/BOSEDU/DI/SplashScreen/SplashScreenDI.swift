//
//  SplashScreenDI.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 30.05.2025.
//

import Foundation

final class SplashScreenDI {
    
    static func make() -> SplashScreenViewModel {
        let useCase = SplashScreenUseCaseImpl()
        return SplashScreenViewModel(useCase: useCase)
    }
    
}
