//
//  ContentView.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 30.05.2025.
//

import SwiftUI
import UIComponents

struct OnboardingView: View {
    
    @StateObject var ovm = OnboardingViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Color.white.ignoresSafeArea()
                    VStack(spacing: 0) {
                        HStack {
                            Image(Images.logoBlue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: geometry.size.height * 0.05)
                            Text(Constants.title)
                                .robotoFont(size: Constants.title_size, font: .extrabold)
                                .foregroundStyle(Colors.primary80)
                        }.padding(.top, geometry.size.height * 0.055)
                        Text(Constants.subtitle)
                            .robotoFont(size: Constants.subtitle_size)
                            .foregroundStyle(Colors.neutral100)
                            .tracking(6)
                            .padding(.bottom, geometry.size.height * 0.098)
                        
                        if let current = ovm.currentScreen {
                            Image(current.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: geometry.size.height * 0.33)
                                .padding(.horizontal, 20)
                            Text(current.title)
                                .robotoFont(size: 26, font: .bold)
                                .padding(.top, geometry.size.height * 0.03)
                            Text(current.subtitle)
                                .robotoFont(size: 14)
                                .foregroundStyle(Colors.neutral70)
                                .multilineTextAlignment(.center)
                                .padding(.top, geometry.size.height * 0.012)
                            SliderView(queue: current.id)
                                .padding(.top, geometry.size.height * 0.034)
                        }
                        
                        ButtonOnboardingView(title: ovm.buttonTitle) {
                            withAnimation(.snappy) {
                                ovm.nextScreen()
                            }
                        }.padding(.top, geometry.size.height * 0.08)
                        
                        
                        Spacer()
                        
                        
                    }
                }
            }
        }
    }
}
#Preview {
    OnboardingView()
}
