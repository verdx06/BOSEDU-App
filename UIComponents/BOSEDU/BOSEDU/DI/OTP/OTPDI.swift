//
//  OTPDIContainer.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 04.06.2025.
//

import Foundation

final class OTPDI {
    
    static func make() -> OTPViewModel {
        
        let useCase = OTPUseCaseImpl()
        return OTPViewModel(useCase: useCase)
        
    }
    
}
