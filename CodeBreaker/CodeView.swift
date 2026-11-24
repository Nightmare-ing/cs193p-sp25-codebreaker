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
    var onButtonTap: (() -> Void)? = nil

    private var guessButton: some View {
        Button("Guess") {
            onButtonTap?()
        }
        .font(.system(size: 80))
        .minimumScaleFactor(0.1)
        .fontWeight(.bold)
    }

    var body: some View {
        HStack {
            ForEach(code.pegs.indices, id: \.self) { idx in
                RoundedRectangle(cornerRadius: 12)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(code.pegs[idx])
                    .onTapGesture {
                        onPegTap?(idx)
                    }
            }
            Rectangle()
                .foregroundStyle(.clear)
                .aspectRatio(contentMode: .fit)
                .overlay {
                    switch code.kind {
                    case .guess:
                        guessButton
                    case .attempt:
                        MatchMarkersView(matches: [.exact, .inexact, .exact, .nomatch])
                    default:
                        EmptyView()
                    }
                }
        }
    }
}

#Preview {
    CodeView(code: Code(pegs: [.red, .blue, .green, .yellow]))
    CodeView(code: Code(pegs: [.red, .blue, .green, .yellow], kind: .guess))
    CodeView(code: Code(pegs: [.red, .blue, .green, .yellow], kind: .attempt))
}
