//
//  OnboardingViewModel.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 30.05.2025.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    
    @Published var queue: [QueueModel] = [
        .init(id: 1, title: "Education Product"),
        .init(id: 2, title: "Join the event"),
        .init(id: 3, title: "Educational News"),
        .init(id: 4, title: "Private Discussion"),
    ]
    
    @Published var currentScreen: QueueModel?
    @Published var buttonTitle: String = "Next"
    @Published var isNavigate: Bool = false
    
    init() {
        nextScreen()
    }
    
    func nextScreen() {
        guard !queue.isEmpty else {
            isNavigate = true
            return
        }
        
        let index = queue.removeFirst()
        
        currentScreen = index
        buttonTitle = index.id == 4 ? "Start Now!" : "Next"
        
    }
    
}
