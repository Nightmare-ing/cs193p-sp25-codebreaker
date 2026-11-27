//
//  PegView.swift
//  CodeBreaker
//
//  Created by Qingsong Hu on 2026/11/25.
//

import SwiftUI

struct PegView: View {
    let peg: Peg

    private var foregroundColor: Color {
        if let name = peg.content {
            Color(name: name) ?? .clear
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
                } else if let name = peg.content, Color(name: name) == nil {
                    Text(name)
                        .font(.system(size: 120))
                        .minimumScaleFactor(9/120)
                } else {
                    EmptyView()
                }
            }
    }
}

