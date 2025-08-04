//
//  SuccessPopUpModifier.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 28.07.2025.
//

import Foundation
import PopupView
import SwiftUI

struct SuccessPopUpModifier: ViewModifier {
    
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        content
        .popup(isPresented: $isPresented) {
            Text("Успешно!")
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .robotoFont(size: 16, font: .bold)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(25)
                .padding(.horizontal)
        } customize: {
            $0
                .type(.floater())
                .position(.top)
                .autohideIn(3)
                .closeOnTap(true)
        }
    }
    
}
