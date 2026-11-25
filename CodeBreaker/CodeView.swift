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

#Preview {
    CodeView(code: Code(pegs: [Peg(content: "red"), Peg(content: "blue"), Peg(content: "green"), Peg(content: "yellow")]))
    CodeView(code: Code(pegs: [.missing, .missing, .missing, .missing]))
    CodeView(code: Code(pegs: [Peg(content: "red"), Peg(content: "blue"), Peg(content: "green"), Peg(content: "yellow")], kind: .guess))
    CodeView(code: Code(pegs: [Peg(content: "red"), Peg(content: "blue"), Peg(content: "green"), Peg(content: "yellow")], kind: .attempt([.exact, .inexact, .nomatch, .nomatch])))
    CodeView(code: Code(pegs: [Peg(content: "red"), Peg(content: "blue"), Peg(content: "green"), Peg(content: "yellow")], kind: .attempt([.exact, .inexact, .nomatch, .nomatch])))
}
