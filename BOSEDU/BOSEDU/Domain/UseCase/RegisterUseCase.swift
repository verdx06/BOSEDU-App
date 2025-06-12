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
}

final class RegisterUseCaseImpl: RegisterUseCase {
    private let validation: ValidationUseCase
    
    init(validation: ValidationUseCase = BaseValidationUseCase()) {
        self.validation = validation
    }
    
    func checkCorrectData(email: String, password: String, passwordConfirm: String, name: String) -> (emailError: String, passwordError: String, passwordConfirmError: String, nameError: String) {
        let emailError = validation.validateEmail(email)
        let passwordError = validation.validatePassword(password)
        let passwordConfirmError = validatePasswordConfirmation(password: password, passwordConfirm: passwordConfirm)
        let nameError = validateName(name)
        return (emailError, passwordError, passwordConfirmError, nameError)
    }
    
    private func validatePasswordConfirmation(password: String, passwordConfirm: String) -> String {
        guard password == passwordConfirm else {
            return "Пароли не совпадают"
        }
        return ""
    }
    
    private func validateName(_ name: String) -> String {
        guard !name.isEmpty else {
            return "Имя не может быть пустым"
        }
        return ""
    }
}
