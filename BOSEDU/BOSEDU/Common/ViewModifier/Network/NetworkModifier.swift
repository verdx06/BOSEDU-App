//
//  NetworkModifier.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 19.07.2025.
//

import SwiftUI
import PopupView
import UIComponents

struct NetworkModifier: ViewModifier {
    
    @EnvironmentObject private var networkMonitor: NetworkMonitor
    
    @State private var isDisconnect: Bool = false
    
    func body(content: Content) -> some View {
        content
            .onChange(of: networkMonitor.isConnected) { isConnect in
                
                isDisconnect = !isConnect
                
            }
            .popup(isPresented: $isDisconnect) {
                Text("Проблемы с интернетом")
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .robotoFont(size: 16, font: .bold)
                    .background(Color.accent50)
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
