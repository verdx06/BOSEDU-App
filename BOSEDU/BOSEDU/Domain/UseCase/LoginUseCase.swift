//
//  LoginUseCase.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 12.06.2025.
//

import Foundation
import SwiftUI

protocol LoginUseCase {
    func checkCorrectData(email: String, password: String) -> (emailError: String, passwordError: String)
    func login(email: String, password: String) async throws
}

final class LoginUseCaseImpl: LoginUseCase {
    
    private let validation: ValidationUseCase
    
    let repository: AuthRepository
    
    init(validation: ValidationUseCase = BaseValidationUseCase(), repository: AuthRepository) {
        self.validation = validation
        self.repository = repository
    }
    
    func login(email: String, password: String) async throws {
       let result = try await repository.login(email: email, password: password)
    }
    
    func checkCorrectData(email: String, password: String) -> (emailError: String, passwordError: String) {
        let emailError = validation.validateEmail(email)
        let passwordError = validation.validatePassword(password)
        if !emailError.isEmpty || !passwordError.isEmpty {
            HapticsManager.shared.notification(type: .error)
        }
        return (emailError, passwordError)
    }
}
