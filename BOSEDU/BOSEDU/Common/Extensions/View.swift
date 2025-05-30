//
//  View.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 30.05.2025.
//

import Foundation
import SwiftUI

extension View {
    
    func robotoFont(size: CGFloat, font: RobotoFont = .regular) -> some View {
        
        switch font {
        case .black:
            self
                .font(.custom("Roboto-Black", size: size))
        case .extrabold:
            self
                .font(.custom("Roboto-ExtraBold", size: size))
        case .bold:
            self
                .font(.custom("Roboto-Bold", size: size))
        case .semiBold:
            self
                .font(.custom("Roboto-SemiBold", size: size))
        case .medium:
            self
                .font(.custom("Roboto-Medium", size: size))
        case .light:
            self
                .font(.custom("Roboto-Light", size: size))
        default:
            self
                .font(.custom("Roboto-Regular", size: size))
        }
        
    }
    
}
