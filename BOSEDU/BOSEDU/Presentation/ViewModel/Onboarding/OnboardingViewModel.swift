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
    @Published var remainingScreens: [QueueModel] = []
    @Published var currentScreen: QueueModel?
    @Published var buttonTitle: String = "Next"
    @Published var isNavigate: Bool = false
    
    init() {
        if let savedId = UserDefaults.standard.object(forKey: "screen") as? Int{
            print(savedId)
            remainingScreens = queue.filter({ $0.id > savedId
            })
        }
        nextScreen()
    }
    
    func nextScreen() {
        guard !remainingScreens.isEmpty else {
            isNavigate = true
            return
        }
        
        let index = remainingScreens.removeFirst()
        currentScreen = index
        buttonTitle = index.id == 4 ? "Start Now!" : "Next"
        
        save(id: index.id)
        
    }
    
    func save(id: Int) {
        UserDefaults.standard.set(id, forKey: "screen")
    }
    
}
