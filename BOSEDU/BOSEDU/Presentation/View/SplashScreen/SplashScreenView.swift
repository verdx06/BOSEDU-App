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
            Color(Colors.splashBackground)
                .ignoresSafeArea()
            VStack {
                HStack(spacing: 0) {
                    Image(Images.logo.rawValue)
                        .padding(.trailing, 4)
                    Text("BOSEDU")
                        .robotoFont(size: 48, font: .extrabold)
                        .foregroundStyle(Color.white)
                }
                Text("BUSINESS EDUCATION")
                    .robotoFont(size: 12)
                    .foregroundStyle(Color.white)
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
