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
    @StateObject var ovm: OTPViewModel
    
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                
                Text("The verification code has been sent.\nCheck the code on your email")
                        .robotoFont(size: 14)
                        .foregroundStyle(Color.neutral100)
                        .multilineTextAlignment(.center)
                        .padding(.top, geo.size.height * 0.022)
                HStack(spacing: 0){
                    Text("sent to ")
                        .robotoFont(size: 14)
                        .foregroundStyle(Color.neutral100)
                    Text(email)
                        .robotoFont(size: 14, font: .semiBold)
                        .foregroundStyle(Color.neutral100)
                }
                
                HStack {
                    ForEach(0..<4, id: \.self) { index in
                        CustomTextFieldView(titleKey: "", style: .OTP, showError: ovm.isError, text: $ovm.code[index])
                            .focused($isFocuse, equals: index)
                            .onChange(of: ovm.code[index]) { newValue in
                                ovm.handleOTPChange(index: index, newValue: newValue)
                                isFocuse = ovm.isFocuse
                            }
                    }
                }.padding(.top, geo.size.height * 0.036)
                
                Group {
                    Text("Didn’t receive code?")
                        .padding(.top, geo.size.height * 0.046)
                    Text("You can resend code in")
                        .padding(.top, geo.size.height * 0.012)
                }.robotoFont(size: 12)
                    .foregroundStyle(Color.neutral100)
                Text(ovm.seconds.timerFormat())
                    .padding(.top, geo.size.height * 0.012)
                    .robotoFont(size: 14, font: .semiBold)
                    .foregroundStyle(Color.primary70)
                
                PrimaryButtonView(title: "Verification", style: .auth) {
                    ovm.sendCode()
                }.padding(.top, geo.size.height * 0.046)
                
                Spacer()
                
            }
            .navigationDestination(isPresented: $ovm.isNavigate, destination: {
                NewPasswordView()
            })
            .headerAuth(title: "OTP Request", dismiss: true).navigationBarBackButtonHidden()
                .onAppear {
                    isFocuse = 0
                }
                .padding(.horizontal, 20)
        }.onAppear {
            ovm.startTimerForResend()
        }
    }
}

#Preview {
    OTPView(email: "bagautdinov@9is.320", ovm: OTPDI.make())
}
