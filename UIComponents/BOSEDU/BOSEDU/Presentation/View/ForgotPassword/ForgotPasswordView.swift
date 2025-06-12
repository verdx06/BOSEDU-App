//
//  ForgotPasswordView.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 31.05.2025.
//

import SwiftUI
import UIComponents

public struct ForgotPasswordView: View {
    
    @StateObject var fvm = ForgotPasswordViewModel()
    
    public var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0) {
                Text("Forgot your password?")
                    .robotoFont(size: 16, font: .semiBold)
                    .foregroundStyle(Colors.neutral100)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, geo.size.height * 0.022)
                
                Text("Enter the registered email to receive help to reset your\npassword.")
                    .robotoFont(size: 12)
                    .foregroundStyle(Colors.neutral70)
                    .padding(.top, geo.size.height * 0.012)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                CustomTextFieldView(titleKey: "Email", text: $fvm.email)
                    .padding(.top, geo.size.height * 0.024)
                
                PrimaryButtonView(title: "Send", style: .auth) {
                    fvm.isNavigate = true
                }
                .padding(.top, geo.size.height * 0.034)
                
                Spacer()
                
            }
            .navigationDestination(isPresented: $fvm.isNavigate, destination: {
                OTPView(email: fvm.email, ovm: OTPDI.make())
            })
            .navigationBarBackButtonHidden()
            .headerAuth(title: "Forgot Password", dismiss: true)
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    NavigationStack {
        ForgotPasswordView()
    }
}
