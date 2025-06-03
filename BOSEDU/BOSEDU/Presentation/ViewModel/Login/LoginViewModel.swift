//
//  LoginViewModel.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 31.05.2025.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
}
