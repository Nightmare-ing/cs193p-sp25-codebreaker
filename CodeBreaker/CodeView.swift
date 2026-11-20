//
//  CodeView.swift
//  CodeBreaker
//
//  Created by Qingsong Hu on 2026/11/5.
//

import SwiftUI

struct CodeView: View {
    var code: Code
    var body: some View {
        HStack {
            ForEach(code.pegs.indices, id: \.self) {
                RoundedRectangle(cornerRadius: 12)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(code.pegs[$0])
            }
            MatchMarkersView(matches: [.exact, .exact, .inexact, .nomatch])
        }
    }
}

#Preview {
    CodeView(code: Code(pegs: [.red, .blue, .green, .yellow]))
}
