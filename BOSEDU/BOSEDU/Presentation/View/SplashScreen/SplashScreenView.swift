//
//  SplashScreenView.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 30.05.2025.
//

import SwiftUI
import UIComponents

struct SplashScreenView: View {
    
    @StateObject var svm: SplashScreenViewModel
    @EnvironmentObject private var networkMonitor: NetworkMonitor
    
    var body: some View {
        ZStack {
            Color(Color.primary80)
                .ignoresSafeArea()
            VStack {
                HStack(spacing: 0) {
                    Image(Images.logo)
                        .padding(.trailing, 4)
                        .offset(x: svm.imageOffset, y: 0)
                        .animation(.easeInOut(duration: 1), value: svm.imageOffset)
                    Text(ConstantsOnboarding.title)
                        .robotoFont(size: ConstantsOnboarding.title_size, font: .extrabold)
                        .foregroundStyle(Color.neutral0)
                        .opacity(svm.textOpacity)
                        .animation(.easeInOut(duration: 1).delay(0.5), value: svm.textOpacity)
                }
                Text(ConstantsOnboarding.subtitle)
                    .robotoFont(size: ConstantsOnboarding.subtitle_size)
                    .foregroundStyle(Color.neutral0)
                    .tracking(6)
                    .opacity(svm.textOpacity)
                    .animation(.easeInOut(duration: 1).delay(0.5), value: svm.textOpacity)
            }
            if !svm.isLoading {
                if svm.isOnboarding {
                    OnboardingView()
                } else {
                    LoginView(lvm: LoginDI.make())
                        .environmentObject(networkMonitor)
                }
            }
            
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                // Перемещаем картинку влево
                svm.imageOffset = 0
                // Показываем текст
                svm.textOpacity = 1
            }
        }
    }
}

#Preview {
    SplashScreenView(svm: SplashScreenDI.make())
}
