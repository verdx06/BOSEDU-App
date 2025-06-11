//
//  String.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 11.06.2025.
//

import Foundation


extension Int {
    
    func timerFormat() -> String {
        let minute = self / 60
        let seconds = self % 60
        return String(format: "%02d:%02d", minute, seconds)
    }
    
}
