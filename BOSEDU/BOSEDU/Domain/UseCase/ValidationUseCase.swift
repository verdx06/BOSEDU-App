//
//  ValidationUseCase.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 12.06.2025.
//

import Foundation

protocol ValidationUseCase {
    func validateEmail(_ email: String) -> String
    func validatePassword(_ password: String) -> String
    func validatePasswordConfirmation(password: String, passwordConfirm: String) -> String
    func validateName(_ name: String) -> String
}

class BaseValidationUseCase: ValidationUseCase {
    func validateEmail(_ email: String) -> String {
        guard !email.isEmpty else {
            return "Почта не может быть пустой"
        }
        guard email.emailValidate() else {
            return "Неверный формат почты"
        }
        return ""
    }
    
    func validatePassword(_ password: String) -> String {
        guard !password.isEmpty else {
            return "Пароль не может быть пустым"
        }
        guard password.count >= 6 else {
            return "Пароль не может быть меньше 6 символов"
        }
        return ""
    }
    
    func validatePasswordConfirmation(password: String, passwordConfirm: String) -> String {
        guard password == passwordConfirm else {
            return "Пароли не совпадают"
        }
        return ""
    }
    
    func validateName(_ name: String) -> String {
        guard !name.isEmpty else {
            return "Имя не может быть пустым"
        }
        return ""
    }
    
}
