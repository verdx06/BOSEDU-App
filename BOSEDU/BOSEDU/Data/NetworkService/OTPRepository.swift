//
//  OTPRepository.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 21.07.2025.
//

import Foundation

protocol OTPRepository {
    func getCode() -> String?
}

final class OTPRepositoryImpl: OTPRepository {
    
    
    func getCode() -> String? {
        UserDefaults.standard.string(forKey: "codeForResend")
    }
    
    
}
