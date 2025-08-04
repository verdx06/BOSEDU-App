//
//  OTPUseCase.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 04.06.2025.
//

import Foundation

protocol OTPUseCase {
    func startTimerForResend() async throws
    func timeString(timeRemaining: Int) -> String
    func getCode() -> String
}


final class OTPUseCaseImpl: OTPUseCase {
    
    let repository: OTPRepository
    
    init(repository: OTPRepository) {
        self.repository = repository
    }
    
    func getCode() -> String {
        let result = repository.getCode()
        return result ?? ""
    }
    
    
    func startTimerForResend() async throws {
        //
    }

    func timeString(timeRemaining: Int) -> String {
        return ""
    }


    
}
