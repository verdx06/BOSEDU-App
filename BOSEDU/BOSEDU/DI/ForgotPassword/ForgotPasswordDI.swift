//
//  ForgotPasswordDI.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 04.06.2025.
//

import Foundation
import NetworkService

final class ForgotPasswordDI {
    
    static func make() -> ForgotPasswordViewModel {
        
        let networkRequest: NetworkRequests = NetworkRequestsImpl()
        let repository: AuthRepository = AuthRepositoryImpl(networkRequest: networkRequest)
        let useCase: ForgotPasswordUseCase = ForgotPasswordUseCaseImpl(repository: repository)
        return ForgotPasswordViewModel(useCase: useCase)
        
    }
    
}
