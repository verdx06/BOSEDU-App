//
//  RegisterUseCase.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 12.06.2025.
//

import Foundation
import SwiftUI

protocol RegisterUseCase {
    func checkCorrectData(email: String, password: String, passwordConfirm: String, name: String) -> (emailError: String, passwordError: String, passwordConfirmError: String, nameError: String)
    func register(email: String, password: String, name: String) async throws
}

final class RegisterUseCaseImpl: RegisterUseCase {
    
    private let validation: ValidationUseCase
    
    let repository: AuthRepository
    
    init(validation: ValidationUseCase = BaseValidationUseCase(), repository: AuthRepository) {
        self.validation = validation
        self.repository = repository
    }
    
    func register(email: String, password: String, name: String) async throws {
        try await repository.register(email: email, password: password, name: name)
    }
    
    func checkCorrectData(email: String, password: String, passwordConfirm: String, name: String) -> (emailError: String, passwordError: String, passwordConfirmError: String, nameError: String) {
        let emailError = validation.validateEmail(email)
        let passwordError = validation.validatePassword(password)
        let passwordConfirmError = validation.validatePasswordConfirmation(password: password, passwordConfirm: passwordConfirm)
        let nameError = validation.validateName(name)
        if !emailError.isEmpty || !passwordError.isEmpty || !passwordConfirmError.isEmpty || !nameError.isEmpty {
            HapticsManager.shared.notification(type: .error)
        }
        return (emailError, passwordError, passwordConfirmError, nameError)
    }
}
