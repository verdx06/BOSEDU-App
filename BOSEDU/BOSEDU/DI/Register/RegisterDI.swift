//
//  RegisterDI.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 12.06.2025.
//

import Foundation
import NetworkService

@MainActor
final class RegisterDI {
    
    static func make() -> RegisterViewModel {
        
        let networkRequest: NetworkRequests = NetworkRequestsImpl()
        let repository: AuthRepository = AuthRepositoryImpl(networkRequest: networkRequest)
        let useCase = RegisterUseCaseImpl(repository: repository)
        return RegisterViewModel(useCase: useCase)
        
    }
    
}
