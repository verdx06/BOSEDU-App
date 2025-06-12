//
//  LoginViewModel.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 31.05.2025.
//

import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var emailErrorText: String = ""
    @Published var passwordErrorText: String = ""
    
    @Published var isNavigate: Bool = false
    @Published var isLoading: Bool = false
    
    let useCase: LoginUseCase
    
    init(useCase: LoginUseCase) {
        self.useCase = useCase
    }
    
    private func authorizate() {
        print("Реализация входа")
    }
    
    func login () {
        let result = useCase.checkCorrectData(email: email, password: password)
        emailErrorText = result.emailError
        passwordErrorText = result.passwordError
        if emailErrorText.isEmpty && passwordErrorText.isEmpty {
            authorizate()
        }
    }
    
}
