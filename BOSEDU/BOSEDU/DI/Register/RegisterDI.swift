//
//  RegisterDI.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 12.06.2025.
//

import Foundation

final class RegisterDI {
    
    static func make() -> RegisterViewModel {
        
        let useCase = RegisterUseCaseImpl()
        return RegisterViewModel(useCase: useCase)
        
    }
    
}
