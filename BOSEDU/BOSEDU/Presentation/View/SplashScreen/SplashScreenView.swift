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
                    Text(Constants.title)
                        .robotoFont(size: Constants.title_size, font: .extrabold)
                        .foregroundStyle(Color.white)
                }
                Text(Constants.subtitle)
                    .robotoFont(size: Constants.subtitle_size)
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
