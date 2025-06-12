//
//  SwiftUIView.swift
//  UIComponents
//
//  Created by Виталий Багаутдинов on 31.05.2025.
//

import SwiftUI

public struct SliderView: View {
    
    let queue: Int
    
    public init(queue: Int) {
        self.queue = queue
    }
    
    public var body: some View {
        HStack {
            ForEach(1...4, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: index == queue ? 23 : 8, height: 8)
                    .foregroundStyle(index == queue ? Color.primary80 : Color.neutral10)
            }
        }
    }
}

#Preview {
    SliderView(queue: 1)
}
