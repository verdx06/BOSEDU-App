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
    func checkCorrectData(email: String, password: String) -> (emailError: String, passwordError: String) {
       let emailError = checkEmail(email: email)
       let passwordError = checkPassword(password: password)
        return (emailError, passwordError)
    }
    
    private func checkEmail(email: String) -> String {
        guard !email.isEmpty else {
            return "Почта не может быть пустой"
        }
        guard email.emailValidate() else {
            return "Неверный формат почты"
        }
        return ""
    }
    
    private func checkPassword(password: String) -> String {
        guard !password.isEmpty else {
            return "Пароль не может быть пустым"
        }
        guard password.count >= 6 else {
            return "Пароль не может быть меньше 6 символов"
        }
        return ""
    }
    
}
