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
        let isonboarding = UserDefaults.standard.object(forKey: "screen") as? Int ?? 0
        startLoading(isOnboarding: isonboarding >= 5)
    }
    
    func startLoading(isOnboarding: Bool) {
        Task {
            do {
                try await useCase.startSplashTimer()
                withAnimation(.interpolatingSpring) {
                    self.isLoading = false
                    self.isOnboarding = isOnboarding
                }
            } catch {
                
            }
        }
    }
    
}
