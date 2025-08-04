//
//  BOSEDUApp.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 30.05.2025.
//

import SwiftUI

@main
struct BOSEDUApp: App {
    
    @StateObject var networkConnection = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView(svm: SplashScreenDI.make())
                .environmentObject(networkConnection)
        }
    }
}
