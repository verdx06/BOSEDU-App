//
//  RegisterViewModel.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 31.05.2025.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var passwordConfirm: String = ""
    
}
