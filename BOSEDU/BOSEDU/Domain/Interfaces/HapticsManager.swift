//
//  HapticsManager.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 23.06.2025.
//

import Foundation
import SwiftUI

class HapticsManager {
    
    static let shared = HapticsManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
        
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
}
