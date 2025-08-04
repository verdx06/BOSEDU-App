//
//  TabbarView.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 26.06.2025.
//

import SwiftUI

struct TabbarView: View {
    
    @EnvironmentObject private var networkMonitor: NetworkMonitor
    
    var body: some View {
        ZStack {
            HomeView()
        }.networkConnect()
    }
}

#Preview {
    TabbarView()
        .environmentObject(NetworkMonitor())
}
