//
//  SwiftUIView.swift
//  UIComponents
//
//  Created by Виталий Багаутдинов on 31.05.2025.
//

import SwiftUI

public struct ButtonOnboardingView: View {
    
    let title: String
    let action: () -> ()
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(title)
                    .foregroundStyle(Colors.neutral100)
                    .robotoFont(size: 16, font: .semiBold)
                Spacer()
                ZStack {
                    Circle()
                        .frame(width: 24, height: 24)
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 6, height: 10)
                        .foregroundColor(Colors.neutral0)
                }
            }.padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Colors.neutral0)
                .cornerRadius(50)
                .shadow(color: Colors.neutral20,radius: 5, x: 0, y: 5)
                .padding(.horizontal)
        }

    }
}

#Preview {
    ButtonOnboardingView(title: "Next") {
        
    }
}
