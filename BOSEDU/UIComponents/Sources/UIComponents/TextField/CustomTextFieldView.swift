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
    @Binding var text: String
    
    public init(titleKey: String, style: StyleTextField = .defaultStyle, security: Bool = false, text: Binding<String>) {
        self.titleKey = titleKey
        self.style = style
        self.security = security
        self._text = text
    }
    
    public var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty && style == .defaultStyle {
                Text(titleKey)
                    .foregroundStyle(Colors.neutral70)
                    .robotoFont(size: 14)
                    .padding(.horizontal, 20)
            }
            
            if security {
                SecureField("", text: $text)
                    .modifier(TextFieldModifier())
            } else {
                TextField("", text: $text)
                    .modifier(TextFieldModifier(style: style))
            }
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        CustomTextFieldView(titleKey: "Email", text: .constant(""))
        CustomTextFieldView(titleKey: "Password", security: true, text: .constant(""))
    }
    .padding()
}
