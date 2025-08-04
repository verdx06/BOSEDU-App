//
//  LoginView.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 31.05.2025.
//

import SwiftUI
import UIComponents

struct LoginView: View {
    
    @StateObject var lvm: LoginViewModel
    @EnvironmentObject private var networkMonitor: NetworkMonitor
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack {
                    CustomTextFieldView(titleKey: "Email", errorText: lvm.emailErrorText, text: $lvm.email)
                        .padding(.top, geo.size.height * 0.034)
                    CustomTextFieldView(titleKey: "Password", security: true, errorText: lvm.passwordErrorText, text: $lvm.password)
                        .padding(.top, geo.size.height * 0.012)
                    
                    NavigationLink {
                        ForgotPasswordView(fvm: ForgotPasswordDI.make())
                    } label: {
                        Text("Forgot Password")
                            .foregroundStyle(Color.primary70)
                            .robotoFont(size: 12, font: .medium)
                    }.padding(.top, geo.size.height * 0.046)
                    
                    PrimaryButtonView(title: "Login", style: .auth, loading: lvm.isLoading) {
                        lvm.login()
                    }.padding(.top, geo.size.height * 0.034)
                    
                    HStack(spacing: 0){
                        Text("Register ")
                            .robotoFont(size: 12)
                            .foregroundStyle(Color.neutral100)
                        NavigationLink {
                            RegisterView(rvm: RegisterDI.make())
                                .environmentObject(networkMonitor)
                        } label: {
                            Text("Here!")
                                .robotoFont(size: 12, font: .semiBold)
                                .foregroundStyle(Color.primary80)
                        }

                    }.padding(.top, geo.size.height * 0.034)
                    
                    VStack {
                        HStack(spacing: 0){
                            Text("By registering, you agree to the")
                                .robotoFont(size: 10)
                                .foregroundStyle(Color.neutral40)
                            Text(" Terms of Service,")
                                .foregroundStyle(Color.neutral50)
                                .robotoFont(size: 10, font: .semiBold)
                        }
                        HStack(spacing: 0) {
                            Text("Privacy Policy")
                                .foregroundStyle(Color.neutral50)
                                .robotoFont(size: 10, font: .semiBold)
                            Text(" and")
                                .foregroundStyle(Color.neutral40)
                                .robotoFont(size: 10)
                            Text(" Cookie Policy.")
                                .foregroundStyle(Color.neutral50)
                                .robotoFont(size: 10, font: .semiBold)
                        }
                    }.padding(.top, geo.size.height * 0.034)
                    
                    Spacer()
                    
                }.headerAuth(title: "Login with Email")
                    .padding(.horizontal, 20)
                    .networkConnect()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    LoginView(lvm: LoginDI.make())
        .environmentObject(NetworkMonitor())
}
