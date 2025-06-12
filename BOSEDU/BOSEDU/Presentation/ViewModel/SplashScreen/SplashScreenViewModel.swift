//
//  SplashScreenViewModel.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 30.05.2025.
//

import Foundation
import SwiftUI

final class SplashScreenViewModel: ObservableObject {
    
    @Published var isOnboarding: Bool = false
    
    let useCase: SplashScreenUseCase
    
    init(useCase: SplashScreenUseCase) {
        self.useCase = useCase
    }
    
    @MainActor
    func startLoading() {
        Task {
            do {
                try await useCase.startSplashTimer()
                withAnimation(.interpolatingSpring) {
                    isOnboarding = true
                }
            } catch {
                
            }
        }
    }
    
}
