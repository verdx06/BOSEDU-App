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
    
    let useCase: ValidationUseCase
    
    init(useCase: ValidationUseCase = BaseValidationUseCase()) {
        self.useCase = useCase
    }
    
    func sendEmailCode() {
        
        emailErrorText = useCase.validateEmail(email)
        if emailErrorText.isEmpty {
            isNavigate = true
        }
        
    }
    
}
