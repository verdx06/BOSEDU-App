//
//  NewPasswordView.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 23.07.2025.
//

import SwiftUI
import PopupView
import UIComponents

struct NewPasswordView: View {
    
    @StateObject var vm = NewPasswordViewModel()
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                
                Spacer()
                
                CustomTextFieldView(titleKey: "New password", security: true, errorText: vm.passwordError, text: $vm.password)
                CustomTextFieldView(titleKey: "Re-enter password", security: true, errorText: vm.passwordConfirmError, text: $vm.passwordConfirm).padding(.top, geo.size.height * 0.012)
                
                PrimaryButtonView(title: "Update password", style: .auth) {
                    vm.isNavigate = true
                    vm.isSuccess = true
                }.padding(.top, geo.size.height * 0.012)
                
                Spacer()
                Spacer()
                
            }.navigationBarBackButtonHidden()
            .headerAuth(title: "New password", dismiss: true)
            .padding(.horizontal, 20)
            .alert("Ошибка", isPresented: $vm.isShowAlert) {
                Button("Ok") {
                    //
                }
            }
            .navigationDestination(isPresented: $vm.isNavigate) {
                LoginView(lvm: LoginDI.make())
                    .successPopUp(isPresented: $vm.isSuccess)
            }
        }
    }
}

#Preview {
    NavigationStack {
        NewPasswordView()
    }
}
