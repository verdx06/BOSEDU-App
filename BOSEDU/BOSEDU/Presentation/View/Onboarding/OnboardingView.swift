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
        ZStack {
            Color.white.ignoresSafeArea()
            VStack{
                HStack {
                    Image(Images.logoBlue)
                    Text(Constants.title)
                        .robotoFont(size: Constants.title_size, font: .extrabold)
                        .foregroundStyle(Colors.primary80)
                }
            Text(Constants.subtitle)
                .robotoFont(size: Constants.subtitle_size)
                .foregroundStyle(Colors.primary100)
                .tracking(6)
                
                Spacer()
                
                
        }
            
        }
    }
}

#Preview {
    OnboardingView()
}
