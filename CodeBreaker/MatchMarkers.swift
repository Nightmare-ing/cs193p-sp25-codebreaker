//
//  MatchMarkers.swift
//  CodeBreaker
//
//  Created by Qingsong Hu on 2026/11/6.
//
import SwiftUI


struct MatchMarkers: View {
    var matches: [Match]
    var body: some View {
        let markerPlaceholders = (matches.count + 1) / 2 * 2
        HStack {
            ForEach(0..<markerPlaceholders/2, id: \.self) { colIdx in
                VStack {
                    ForEach((2 * colIdx)..<(2 * colIdx + 2), id: \.self) { idx in
                        matchMarker(with: idx)
                    }
                }
            }
        }
    }

    @ViewBuilder
    func matchMarker(with pegIdx: Int) -> some View {
        let exactNum = self.matches.count { $0 == .exact }
        let matchCnt = self.matches.count { $0 != .nomatch }
        
        Circle()
            .fill(pegIdx < exactNum ? .primary : Color.clear)
            .strokeBorder(pegIdx < matchCnt ? .primary : Color.clear, lineWidth: 3)
            .aspectRatio(1, contentMode: .fit)
            .opacity(pegIdx < matchCnt ? 1 : 0)
    }
    
}

enum Match {
    case nomatch
    case inexact
    case exact
}

struct MatchMarkersPreview: View {
    let matches: [Match]
    var body: some View {
        HStack {
            ForEach(0..<matches.count, id: \.self) { _ in
                Circle()
            }
            MatchMarkers(matches: matches)
        }.padding()
    }
}

#Preview {
    VStack(alignment: .leading) {
        MatchMarkersPreview(matches: [.exact, .inexact, .inexact])
        MatchMarkersPreview(matches: [.exact, .nomatch, .nomatch])

        MatchMarkersPreview(matches: [.exact, .exact, .inexact, .inexact])
        MatchMarkersPreview(matches: [.exact, .exact, .inexact, .nomatch])
        MatchMarkersPreview(matches: [.exact, .inexact, .nomatch, .nomatch])

        MatchMarkersPreview(matches: [.exact, .exact, .exact, .inexact, .nomatch, .nomatch])
        MatchMarkersPreview(matches: [.exact, .exact, .inexact, .inexact, .inexact, .exact])

        MatchMarkersPreview(matches: [.exact, .exact, .inexact, .inexact, .inexact])
        MatchMarkersPreview(matches: [.exact, .inexact, .inexact, .nomatch, .nomatch])
    }
}
