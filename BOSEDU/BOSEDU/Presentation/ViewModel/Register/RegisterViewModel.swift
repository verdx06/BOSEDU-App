//
//  RegisterViewModel.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 31.05.2025.
//

import Foundation
import UIComponents
import SwiftUI

@MainActor
final class RegisterViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var passwordConfirm: String = ""
    
    @Published var emailError: String = ""
    @Published var nameError: String = ""
    @Published var passwordError: String = "" 
    @Published var passwordConfirmError: String = ""
    
    @Published var status: LoadingStatus = .idle
    @Published var isSuccess: Bool = false
    
    @Published var user: UserInfoModel?
    
    let useCase: RegisterUseCase
    
    init(useCase: RegisterUseCase) {
        self.useCase = useCase
    }
    
    private func registerUser() {
        status = .loading
        Task {
            do {
                user = try await useCase.register(email: email, password: password, name: name)
                status = .success
                isSuccess = status == .loading
            } catch {
                status = .failure(error.localizedDescription)
            }
        }
    }
    
    func register() {
        let result = useCase.checkCorrectData(
            email: email,
            password: password,
            passwordConfirm: passwordConfirm,
            name: name
        )
        emailError = result.emailError
        passwordError = result.passwordError
        passwordConfirmError = result.passwordConfirmError
        nameError = result.nameError
        
        if emailError.isEmpty && passwordError.isEmpty && passwordConfirmError.isEmpty && nameError.isEmpty {
            registerUser()
        }
        
    }
    
    func showFailerAlert() -> Alert {
        return Alert(title: Text(status.failureText ?? ""))
    }
    
}
