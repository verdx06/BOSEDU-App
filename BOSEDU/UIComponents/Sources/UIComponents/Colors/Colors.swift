//
//  File.swift
//  UIComponents
//
//  Created by Виталий Багаутдинов on 30.05.2025.
//

import Foundation
import SwiftUI

enum ColorPalette: String, CaseIterable {
    case primary
    case neutral
    case accent
    // Добавь другие палитры по необходимости (error, success, warning и т.д.)
}

public final class Colors {
    private static func color(_ palette: ColorPalette, _ level: Int) -> Color {
        let name = "\(palette.rawValue)\(level)"
        return Color(name, bundle: .module)
    }

    // MARK: - Primary Colors (10...100)
    public static let primary10  = color(.primary, 10)
    public static let primary20  = color(.primary, 20)
    public static let primary30  = color(.primary, 30)
    public static let primary40  = color(.primary, 40)
    public static let primary50  = color(.primary, 50)
    public static let primary60  = color(.primary, 60)
    public static let primary70  = color(.primary, 70)
    public static let primary80  = color(.primary, 80)
    public static let primary90  = color(.primary, 90)
    public static let primary100 = color(.primary, 100)

    // MARK: - Neutral Colors (0...100)
    public static let neutral0   = color(.neutral, 0)
    public static let neutral10  = color(.neutral, 10)
    public static let neutral20  = color(.neutral, 20)
    public static let neutral30  = color(.neutral, 30)
    public static let neutral40  = color(.neutral, 40)
    public static let neutral50  = color(.neutral, 50)
    public static let neutral60  = color(.neutral, 60)
    public static let neutral70  = color(.neutral, 70)
    public static let neutral80  = color(.neutral, 80)
    public static let neutral90  = color(.neutral, 90)
    public static let neutral100 = color(.neutral, 100)

    // MARK: - Accent Colors (10...100)
    public static let accent10   = color(.accent, 10)
    public static let accent20   = color(.accent, 20)
    public static let accent30   = color(.accent, 30)
    public static let accent40   = color(.accent, 40)
    public static let accent50   = color(.accent, 50)
    public static let accent60   = color(.accent, 60)
    public static let accent70   = color(.accent, 70)
    public static let accent80   = color(.accent, 80)
    public static let accent90   = color(.accent, 90)
    public static let accent100  = color(.accent, 100)
}
