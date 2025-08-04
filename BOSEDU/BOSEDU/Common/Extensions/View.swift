//
//  View.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 19.07.2025.
//

import Foundation
import SwiftUI

extension View {
    
    func networkConnect() -> some View {
        self
            .modifier(NetworkModifier())
    }
    
    func successPopUp(isPresented: Binding<Bool>) -> some View {
        self
            .modifier(SuccessPopUpModifier(isPresented: isPresented))
    }
    
}
