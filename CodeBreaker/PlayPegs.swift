//
//  PlayPegs.swift
//  CodeBreaker
//
//  Created by Qingsong Hu on 2026/11/5.
//

import SwiftUI

struct PlayPegs: View {
    var pegColors: [Color]
    var body: some View {
        HStack {
            ForEach(pegColors.indices, id: \.self) {
                RoundedRectangle(cornerRadius: 12)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(pegColors[$0])
            }
            MatchMarkers(matches: [.exact, .exact, .inexact, .nomatch])

        }
    }
}

#Preview {
    PlayPegs(pegColors: [.red, .blue, .green, .yellow])
}
