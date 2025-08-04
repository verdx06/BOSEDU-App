//
//  NetworkModifier.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 19.07.2025.
//

import SwiftUI
import PopupView

struct NetworkModifier: ViewModifier {
    
    @Binding var isDisconnected: Bool
    
    func body(content: Content) -> some View {
        content
            .popup(isPresented: $isDisconnected) {
                Text("Проблемы с интернетом")
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.red.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(25)
                    .padding(.horizontal)
            } customize: {
                $0
                    .type(.floater())
                    .position(.top)
                    .autohideIn(5)
            }
    }
    
}
