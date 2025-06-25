//
//  LoginViewModel.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 31.05.2025.
//

import Foundation

struct User: Codable {
    let username: String
    let phone: String
    let firstName: String
    let lastName: String
    let photoURL: String
    let password: String
    
    // Если имена полей отличаются от JSON, можно использовать CodingKeys
    enum CodingKeys: String, CodingKey {
        case username
        case phone
        case firstName = "first_name"
        case lastName = "last_name"
        case photoURL = "photo_url"
        case password
    }
}

@MainActor
final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var emailErrorText: String = ""
    @Published var passwordErrorText: String = ""
    
    @Published var isNavigate: Bool = false
    @Published var isLoading: Bool = false
    
    let useCase: LoginUseCase
    
    init(useCase: LoginUseCase) {
        self.useCase = useCase
    }
    
    @MainActor
    private func authorizateUser() {
        Task {
            do {
                try await useCase.login(email: email, password: password)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func login () {
        let result = useCase.checkCorrectData(email: email, password: password)
        emailErrorText = result.emailError
        passwordErrorText = result.passwordError
        if emailErrorText.isEmpty && passwordErrorText.isEmpty {
            authorizateUser()
        }
    }
    
}
