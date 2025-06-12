//
//  RegisterView.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 31.05.2025.
//

import SwiftUI
import UIComponents

struct RegisterView: View {
    
    @StateObject var rvm = RegisterViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack {
                    CustomTextFieldView(titleKey: "Name", text: $rvm.name)
                        .padding(.top, geo.size.height * 0.034)
                    CustomTextFieldView(titleKey: "Email", text: $rvm.email)
                        .padding(.top, geo.size.height * 0.012)
                    CustomTextFieldView(titleKey: "Password", security: true ,text: $rvm.password)
                        .padding(.top, geo.size.height * 0.012)
                    CustomTextFieldView(titleKey: "Re-enter Password", security: true ,text: $rvm.password)
                        .padding(.top, geo.size.height * 0.012)
                    
                    PrimaryButtonView(title: "Register Now", style: .auth) {
                        //
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
                    
                }.headerAuth(title: "Register with Email", dismiss: true)
                    .padding(.horizontal, 20)
            }.navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    RegisterView()
}
