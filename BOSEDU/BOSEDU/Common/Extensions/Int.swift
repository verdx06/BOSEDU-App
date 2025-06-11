//
//  String.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 11.06.2025.
//

import Foundation


extension String {
    
    func timerFormat(seconds: Int) -> String {
        let minute = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minute, seconds)
    }
    
}
