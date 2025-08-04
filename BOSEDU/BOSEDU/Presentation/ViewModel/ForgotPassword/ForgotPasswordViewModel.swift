//
//  ForgotPasswordViewModel.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 02.06.2025.
//

import Foundation


final class ForgotPasswordViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var emailErrorText: String = ""
    @Published var isNavigate: Bool = false
    @Published var isLoading: Bool = false
    
    let validationUseCase: ValidationUseCase
    let useCase: ForgotPasswordUseCase
    
    init(validationUseCase: ValidationUseCase = BaseValidationUseCase(), useCase: ForgotPasswordUseCase) {

        self.validationUseCase = validationUseCase
        self.useCase = useCase
    }
    
    @MainActor
    func sendEmailCode() {
        Task {
                do {
                    isLoading = true
                    self.emailErrorText = validationUseCase.validateEmail(email)
                    if emailErrorText.isEmpty {
                        try await useCase.sendCode(email: email)
                        self.isNavigate = true
                    }
                    isLoading = false
                } catch {
                    print(error.localizedDescription)
                    isLoading = false
                }
            }
        }
    
}
