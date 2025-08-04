//
//  ForgotPasswordUseCase.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 21.07.2025.
//

import Foundation

protocol ForgotPasswordUseCase {
    func sendCode(email: String) async throws
}

final class ForgotPasswordUseCaseImpl: ForgotPasswordUseCase {
    
    let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func sendCode(email: String) async throws {
        try await repository.sendEmailCode(email: email, code: generateCode())
    }
    
    private func generateCode() -> String {
        let letters = Array("0123456789")
        var code = ""
        for _ in 0..<4 {
            let randomIndex = Int.random(in: 0..<letters.count)
            code.append(letters[randomIndex])
        }
        
        return code
        
    }
    
    
}
