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
                PegView(peg: code.pegs[idx])
                    .contentShape(Rectangle())
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
                    case .attempt(let matches):
                        MatchMarkersView(matches: matches)
                    default:
                        EmptyView()
                    }
                }
        }
    }
}


private let testPegs = ["red", "blue", "green", "yellow"].map { Peg(content: $0) }

#Preview {
    CodeView(code: Code(pegs: testPegs))
    CodeView(code: Code(pegs: Array(repeating: .missing, count: 4)))
    CodeView(code: Code(pegs: testPegs, kind: .guess))
    CodeView(code: Code(pegs: testPegs, kind: .attempt([.exact, .inexact, .nomatch, .nomatch])))
    CodeView(code: Code(pegs: testPegs, kind: .attempt([.exact, .inexact, .nomatch, .nomatch])))
}
