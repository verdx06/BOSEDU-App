//
//  OTPDIContainer.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 04.06.2025.
//

import Foundation
import NetworkService

final class OTPDI {
    
    static func make() -> OTPViewModel {
        
        let networkRequest: NetworkRequests = NetworkRequestsImpl()
        let repository: AuthRepository = AuthRepositoryImpl(networkRequest: networkRequest)
        let useCase: OTPUseCase = OTPUseCaseImpl(repository: repository)
        return OTPViewModel(useCase: useCase)
        
    }
    
}
