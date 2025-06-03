//
//  SwiftUIView.swift
//  UIComponents
//
//  Created by Виталий Багаутдинов on 31.05.2025.
//

import SwiftUI

public struct HeaderAuthView: View {
    
    let title: String
    let dismiss: Bool
    @Environment(\.presentationMode) var presentationMode
    
    public init(title: String, dismiss: Bool) {
        self.title = title
        self.dismiss = dismiss
    }
    
    public var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0) {
                if dismiss {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(Colors.neutral100)
                    }

                }
                Text(title)
                    .robotoFont(size: 14, font: .semiBold)
                    .padding(.leading, 20)
                Spacer()
            }.padding(.bottom, 10)
            
            Divider()
            
        }
    }
}

#Preview {
    HeaderAuthView(title: "Login with Email", dismiss: true)
}
