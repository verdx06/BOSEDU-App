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
}


final class OTPUseCaseImpl: OTPUseCase {
    
    func startTimerForResend() async throws {
        //
    }

    func timeString(timeRemaining: Int) -> String {
        return ""
    }


    
}
