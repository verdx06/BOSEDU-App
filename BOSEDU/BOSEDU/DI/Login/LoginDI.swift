//
//  LoginDI.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 12.06.2025.
//

import Foundation
import NetworkService

@MainActor
final class LoginDI {
    
    static func make() -> LoginViewModel {
        
        let networkRequest: NetworkRequests = NetworkRequestsImpl()
        let reposiroty: AuthRepository = AuthRepositoryImpl(networkRequest: networkRequest)
        let useCase: LoginUseCase = LoginUseCaseImpl(repository: reposiroty)
        return LoginViewModel(useCase: useCase)
        
    }
    
}
