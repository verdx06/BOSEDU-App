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
    
    func sendEmailCode() {
        
        if email.emailValidate() {
            isNavigate = true
        } else {
            emailErrorText = "Неверный формат email"
        }
        
        
    }
    
}
