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

private struct MatchMarkers: View {
    var matches: [Match]
    var body: some View {
        VStack {
            HStack {
                matchMarker(with: 0)
                matchMarker(with: 1)
            }
            HStack {
                matchMarker(with: 2)
                matchMarker(with: 3)
            }
        }
    }
    
    func matchMarker(with pegIdx: Int) -> some View {
        let exactNum = self.matches.count { $0 == .exact }
        let matchCnt = self.matches.count { $0 != .nomatch }
        
        return Circle()
                .fill(pegIdx < exactNum ? .primary : Color.clear)
                .strokeBorder(pegIdx < matchCnt ? .primary : Color.clear, lineWidth: 3)
                .aspectRatio(1, contentMode: .fit)
                .opacity(pegIdx < matchCnt ? 1 : 0)
    }
    
}

private enum Match {
    case nomatch
    case inexact
    case exact
}

#Preview {
    PlayPegs(pegColors: [.red, .blue, .green, .yellow])
}
