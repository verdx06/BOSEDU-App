//
//  SwiftUIView.swift
//  UIComponents
//
//  Created by Виталий Багаутдинов on 31.05.2025.
//

import SwiftUI

public struct CustomTextFieldView: View {
    
    let titleKey: String
    let style: StyleTextField
    let security: Bool
    let errorText: String
    @Binding var text: String
    
    public init(titleKey: String, style: StyleTextField = .defaultStyle, security: Bool = false, errorText: String = "", text: Binding<String>) {
        self.titleKey = titleKey
        self.style = style
        self.security = security
        self.errorText = errorText
        self._text = text
    }
    
    public var body: some View {
        VStack (alignment: .leading){
            ZStack(alignment: .leading) {
                if security {
                    SecureField("", text: $text)
                        .modifier(TextFieldModifier(error: !errorText.isEmpty))
                } else {
                    TextField("", text: $text)
                        .modifier(TextFieldModifier(style: style, error: !errorText.isEmpty))
                    
                }
                
                if text.isEmpty && style == .defaultStyle {
                    Text(titleKey)
                        .foregroundStyle(Color.neutral70)
                        .robotoFont(size: 14)
                        .padding(.horizontal, 20)
                }
                
            }
            if !errorText.isEmpty {
                Text(errorText)
                    .robotoFont(size: 12, font: .semiBold)
                    .foregroundStyle(Color.accent50)
                    .padding(.horizontal, 10)
            }
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        CustomTextFieldView(titleKey: "Email", errorText: "Неверный формат", text: .constant(""))
        CustomTextFieldView(titleKey: "Password", security: true, text: .constant(""))
    }
    .padding()
}
