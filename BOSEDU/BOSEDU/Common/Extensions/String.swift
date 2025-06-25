//
//  String.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 11.06.2025.
//

import Foundation
import SwiftUI

extension String {
    
    func emailValidate() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return predicate.evaluate(with: self)
    }
    
    func passwordValidate() -> Bool {
        return self.count >= 6 && self.contains(where: { $0.isUppercase }) && self.contains(where: { $0.isLowercase })
    }
    
}
