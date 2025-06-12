//
//  File.swift
//  UIComponents
//
//  Created by Виталий Багаутдинов on 02.06.2025.
//

import Foundation
import SwiftUI

public struct TextFieldModifier: ViewModifier {
    
    @FocusState var isFocused: Bool
    let style: StyleTextField
    let error: Bool
    
    public init(style: StyleTextField = .defaultStyle, error: Bool = false) {
        self.style = style
        self.error = error
    }
    
    private var foregroundColor: Color {
        if error {
            return Colors.accent60
        } else {
            return isFocused ? Colors.primary70 : Colors.neutral70
        }
    }
    
    public func body(content: Content) -> some View {
        content
            .padding(.horizontal, 20)
            .frame(maxWidth: style == .defaultStyle ? .infinity : nil)
            .frame(width: style == .defaultStyle ? nil : 55)
            .frame(height: style == .defaultStyle ? 49 : 54)
            .foregroundStyle(style == .defaultStyle ? Colors.neutral70 : Colors.neutral100)
            .robotoFont(size: style == .defaultStyle ? 14 : 20, font: .semiBold)
            .multilineTextAlignment(style == .defaultStyle ? .leading : .center)
            .background(error ? Colors.accent20.opacity(0.5) : .clear)
            .cornerRadius(style == .defaultStyle ? 50 : 10)
            .focused($isFocused)
            .overlay {
                RoundedRectangle(cornerRadius: style == .defaultStyle ? 50 : 10)
                    .stroke(lineWidth: isFocused || error ? 1 : 0.5)
                    .foregroundStyle(foregroundColor)
            }
    }
    
}
