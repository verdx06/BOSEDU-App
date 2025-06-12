//
//  SwiftUIView.swift
//  UIComponents
//
//  Created by Виталий Багаутдинов on 31.05.2025.
//

import SwiftUI

public struct HeaderAuth: ViewModifier {
    
    let title: String
    let dismiss: Bool
    
    public init(title: String, dismiss: Bool) {
        self.title = title
        self.dismiss = dismiss
    }
    
    public func body(content: Content) -> some View {
        VStack {
            HeaderAuthView(title: title, dismiss: dismiss).padding(.top, 20)
            Spacer()
            content
            Spacer()
        }
    }
}

public extension View {
    
    func headerAuth(title: String, dismiss: Bool? = nil) -> some View {
        self
            .modifier(HeaderAuth(title: title, dismiss: dismiss ?? false))
    }
    
}
