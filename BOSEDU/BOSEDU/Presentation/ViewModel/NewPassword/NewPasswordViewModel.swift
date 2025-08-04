//
//  NewPasswordViewModel.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 24.07.2025.
//

import Foundation

final class NewPasswordViewModel: ObservableObject {
    
    @Published var password: String = ""
    @Published var passwordConfirm: String = ""
    
    @Published var passwordError: String = ""
    @Published var passwordConfirmError: String = ""
    
    @Published var status: LoadingStatus = .idle
    @Published var isShowAlert: Bool = false
    @Published var isNavigate: Bool = false
    @Published var isSuccess: Bool = false
    
    let validationUseCase: ValidationUseCase
    
    init(validationUseCase: ValidationUseCase = BaseValidationUseCase()) {
        self.validationUseCase = validationUseCase
    }
    
    func updatePassword() {
        status = .loading
        passwordError = validationUseCase.validatePassword(password)
        passwordConfirmError = validationUseCase.validatePasswordConfirmation(password: password, passwordConfirm: passwordConfirm)
        guard passwordError.isEmpty && passwordConfirmError.isEmpty else {
            status = .failure("Ошибка")
            isShowAlert = true
            return
        }
            status = .success
            print("update Password")
        isSuccess = isNavigate
        
    }
    
}
