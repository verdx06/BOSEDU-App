//
//  LoginDI.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 12.06.2025.
//

import Foundation

@MainActor
final class LoginDI {
    
    static func make() -> LoginViewModel {
        
        let useCase = LoginUseCaseImpl()
        return LoginViewModel(useCase: useCase)
        
    }
    
}
