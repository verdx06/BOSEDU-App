//
//  SwiftUIView.swift
//  UIComponents
//
//  Created by Виталий Багаутдинов on 02.06.2025.
//

import SwiftUI

public struct PrimaryButtonView: View {
    
    let title: String
    let style: StyleButton
    let loading: Bool
    let action: () -> ()
    
    public init(title: String, style: StyleButton, loading: Bool = false, action: @escaping () -> Void) {
        self.title = title
        self.style = style
        self.loading = loading
        self.action = action
    }
    
    public var body: some View {
        if loading {
            ProgressView().padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(style == .onboarding ? Color.neutral0 : Color.primary70)
                    .cornerRadius(50)
                    .shadow(color: Color.neutral20, radius: style == .onboarding ? 5 : 0, x: 0, y: style == .onboarding ? 5 : 0)
        } else {
            Button {
                action()
            } label: {
                HStack {
                    Text(title)
                        .foregroundStyle(style == .onboarding ? Color.neutral100 : Color.neutral0)
                        .robotoFont(size: 16, font: .semiBold)
                    if style == .onboarding {
                        Spacer()
                        ZStack {
                            Circle()
                                .frame(width: 24, height: 24)
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 6, height: 10)
                                .foregroundColor(Color.neutral0)
                        }
                    }
                }.padding(.horizontal, 20)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(style == .onboarding ? Color.neutral0 : Color.primary70)
                    .cornerRadius(50)
                    .shadow(color: Color.neutral20, radius: style == .onboarding ? 5 : 0, x: 0, y: style == .onboarding ? 5 : 0)
            }
        }
    }
}

#Preview {
    PrimaryButtonView(title: "Login", style: .auth, loading: false) {
        //
    }
}
