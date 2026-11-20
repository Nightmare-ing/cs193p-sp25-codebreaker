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
            switch code.kind {
            case .attempt:
                MatchMarkersView(matches: [.exact, .exact, .inexact, .nomatch])
            case .master, nil:
                Rectangle()
                    .fill(.clear)
                    .aspectRatio(1, contentMode: .fit)
            case .guess:
                Rectangle()
                    .fill(.clear)
                    .aspectRatio(1, contentMode: .fit)
                    .overlay {
                        Button("Guess") {
                            onButtonTap?()
                        }
                        .font(.system(size: 80))
                        .minimumScaleFactor(0.1)
                        .fontWeight(.bold)
                    }
            }
        }
    }
}

#Preview {
    CodeView(code: Code(pegs: [.red, .blue, .green, .yellow]))
    CodeView(code: Code(pegs: [.red, .blue, .green, .yellow], kind: .attempt))
}
