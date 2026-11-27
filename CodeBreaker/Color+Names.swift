//
//  Color+Names.swift
//  CodeBreaker
//
//  Created by Qingsong Hu on 2026/11/27.
//

import SwiftUI

extension Color {
    private static let builtInColors: [String: Color] = [
        "black": .black,
        "blue": .blue,
        "brown": .brown,
        "clear": .clear,
        "cyan": .cyan,
        "gray": .gray,
        "green": .green,
        "indigo": .indigo,
        "mint": .mint,
        "orange": .orange,
        "pink": .pink,
        "purple": .purple,
        "red": .red,
        "teal": .teal,
        "white": .white,
        "yellow": .yellow,
        "primary": .primary,
        "secondary": .secondary,
        "accentcolor": .accentColor
    ]
    
    static var builtInNames: [String] {
        Array(builtInColors.keys)
    }
    
    private static let unsuitableForPegs: Set<String> = [
        "white", "black", "clear", "primary", "secondary", "accentColor"
    ]
    
    static var playableNames: [String] {
        builtInNames.filter { !unsuitableForPegs.contains($0) }
    }
    
    init?(name: String) {
        guard let color = Color.builtInColors[name.lowercased()] else { return nil }
        self = color
    }
}

