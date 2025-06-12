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
}

final class LoginUseCaseImpl: LoginUseCase {
    private let validation: ValidationUseCase
    
    init(validation: ValidationUseCase = BaseValidationUseCase()) {
        self.validation = validation
    }
    
    func checkCorrectData(email: String, password: String) -> (emailError: String, passwordError: String) {
        let emailError = validation.validateEmail(email)
        let passwordError = validation.validatePassword(password)
        return (emailError, passwordError)
    }
}
