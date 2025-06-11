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
    
    var body: some View {
        ZStack {
            Color(Colors.primary80)
                .ignoresSafeArea()
            VStack {
                HStack(spacing: 0) {
                    Image(Images.logo)
                        .padding(.trailing, 4)
                    Text(ConstantsOnboarding.title)
                        .robotoFont(size: ConstantsOnboarding.title_size, font: .extrabold)
                        .foregroundStyle(Colors.neutral0)
                }
                Text(ConstantsOnboarding.subtitle)
                    .robotoFont(size: ConstantsOnboarding.subtitle_size)
                    .foregroundStyle(Colors.neutral0)
                    .tracking(6)
            }
            
            if !svm.isLoading {
                OnboardingView()
                
            }
        }.onAppear {
            svm.startLoading()
        }
    }
}

#Preview {
    SplashScreenView(svm: SplashScreenDI.make())
}
