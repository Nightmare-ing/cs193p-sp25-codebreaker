//
//  CodeView.swift
//  CodeBreaker
//
//  Created by Qingsong Hu on 2026/11/5.
//

import SwiftUI

struct CodeView: View {
    let code: Code
    var onPegTap: ((Int) -> Void)? = nil

    var body: some View {
        HStack {
            ForEach(code.pegs.indices, id: \.self) { idx in
                RoundedRectangle(cornerRadius: 12)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(code.pegs[idx])
                    .onTapGesture {
                        if let onPegTap {
                            onPegTap(idx)
                        }
                    }
            }
            MatchMarkersView(matches: [.exact, .exact, .inexact, .nomatch])
        }
    }
}

#Preview {
    CodeView(code: Code(pegs: [.red, .blue, .green, .yellow]))
}
