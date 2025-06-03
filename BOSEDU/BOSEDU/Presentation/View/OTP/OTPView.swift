//
//  OTPView.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 02.06.2025.
//

import SwiftUI
import UIComponents

struct OTPView: View {
    
    let email: String
    @FocusState var isFocuse: Int?
    @State var code: [String] = Array(repeating: "", count: 4)
    
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                
                Text("The verification code has been sent.\nCheck the code on your email")
                        .robotoFont(size: 14)
                        .foregroundStyle(Colors.neutral100)
                        .padding(.top, geo.size.height * 0.022)
                HStack(spacing: 0){
                    Text("sent to ")
                        .robotoFont(size: 14)
                        .foregroundStyle(Colors.neutral100)
                    Text(email)
                        .robotoFont(size: 14, font: .semiBold)
                        .foregroundStyle(Colors.neutral100)
                }
                
                HStack {
                    ForEach(0..<4, id: \.self) { index in
                        CustomTextFieldView(titleKey: "", style: .OTP, text: $code[index])
                            .focused($isFocuse, equals: index)
                            .onChange(of: code[index]) { newValue in
                                
                                if code[index].count > 1 {
                                    code[index] = String(code[index].suffix(1))
                                }
                                
                                if !newValue.isEmpty {
                                    if index == 3 {
                                        isFocuse = nil
                                    } else {
                                        isFocuse = (isFocuse ?? 0) + 1
                                    }
                                } else {
                                    isFocuse = (isFocuse ?? 0) - 1
                                }
                            }
                    }
                }.padding(.top, geo.size.height * 0.036)
                
                Group {
                    Text("Didn’t receive code?")
                        .padding(.top, geo.size.height * 0.046)
                    Text("You can resend code in")
                        .padding(.top, geo.size.height * 0.012)
                }.robotoFont(size: 12)
                    .foregroundStyle(Colors.neutral100)
                Text("TIMER")
                    .padding(.top, geo.size.height * 0.012)
                
                PrimaryButtonView(title: "Verification", style: .auth) {
                    //
                }.padding(.top, geo.size.height * 0.046)
                
                Spacer()
                
            }.headerAuth(title: "OTP Request", dismiss: true).navigationBarBackButtonHidden()
                .onAppear {
                    isFocuse = 0
                }
                .padding(.horizontal, 20)
        }
    }
}

#Preview {
    OTPView(email: "Даун")
}
