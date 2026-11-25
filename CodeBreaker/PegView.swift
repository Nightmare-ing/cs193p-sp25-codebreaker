//
//  PegView.swift
//  CodeBreaker
//
//  Created by Qingsong Hu on 2026/11/25.
//

import SwiftUI

struct PegView: View {
    let peg: Peg
    private let colorsByName: [String:Color] = [
        "red": .red,
        "green": .green,
        "blue": .blue,
        "yellow": .yellow,
        "orange": .orange,
        "brown": .brown,
    ]

    private var foregroundColor: Color {
        if let name = peg.content {
            colorsByName[name] ?? .clear
        } else {
            .clear
        }
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .aspectRatio(1, contentMode: .fit)
            .foregroundStyle(foregroundColor)
            .overlay {
                if peg == .missing {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(.gray)
                } else if let name = peg.content, colorsByName[name] == nil {
                    Text(name)
                        .font(.system(size: 120))
                        .minimumScaleFactor(9/120)
                } else {
                    EmptyView()
                }
            }
    }
}

