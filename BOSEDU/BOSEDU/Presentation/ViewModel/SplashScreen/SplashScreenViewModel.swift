//
//  SplashScreenViewModel.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 30.05.2025.
//

import Foundation
import SwiftUI

@MainActor
final class SplashScreenViewModel: ObservableObject {
    
    @Published var isOnboarding: Bool = false
    @Published var isLoading: Bool = true
    
    @Published var imageOffset: CGFloat = 100
    @Published var textOpacity: Double = 0
    
    let useCase: SplashScreenUseCase
    
    init(useCase: SplashScreenUseCase) {
        self.useCase = useCase
        showOnboarding()
        startLoading()
    }
    
    func startLoading() {
        Task {
            do {
                try await useCase.startSplashTimer()
                withAnimation(.interpolatingSpring) {
                    self.isLoading = false
                }
            } catch {
                
            }
        }
    }
    
    private func showOnboarding() {
        Task {
            do {
                self.isOnboarding = try await useCase.isOnboardingShown()
            } catch {
                
            }
        }
    }
    
}
