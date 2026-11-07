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
        let halfMarkers = (matches.count + 1) / 2
        VStack {
            HStack {
                ForEach(0..<halfMarkers, id: \.self) { idx in
                    matchMarker(with: idx)
                }
            }
            HStack {
                ForEach(halfMarkers..<halfMarkers * 2, id: \.self) { idx in
                    matchMarker(with: idx)
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

#Preview {
    VStack(alignment: .leading) {
        HStack {
            ForEach(0..<3, id: \.self) { _ in
                Circle()
            }
            MatchMarkers(matches: [.exact, .inexact, .inexact])
        }.padding()
        HStack {
            ForEach(0..<3, id: \.self) { _ in
                Circle()
            }
            MatchMarkers(matches: [.exact, .nomatch, .nomatch])
        }.padding()

        HStack {
            ForEach(0..<4, id: \.self) { _ in
                Circle()
            }
            MatchMarkers(matches: [.exact, .exact, .inexact, .inexact])
        }.padding()
        HStack {
            ForEach(0..<4, id: \.self) { _ in
                Circle()
            }
            MatchMarkers(matches: [.exact, .exact, .inexact, .inexact])
        }.padding()
        HStack {
            ForEach(0..<4, id: \.self) { _ in
                Circle()
            }
            MatchMarkers(matches: [.exact, .exact, .inexact, .inexact])
        }.padding()

        HStack {
            ForEach(0..<6, id: \.self) { _ in
                Circle()
            }
            MatchMarkers(matches: [.exact, .exact, .inexact, .inexact, .exact, .exact])
        }.padding()
        HStack {
            ForEach(0..<6, id: \.self) { _ in
                Circle()
            }
            MatchMarkers(matches: [.exact, .exact, .inexact, .inexact, .exact, .exact])
        }.padding()

        HStack {
            ForEach(0..<5, id: \.self) { _ in
                Circle()
            }
            MatchMarkers(matches: [.exact, .exact, .inexact, .inexact, .nomatch])
        }.padding()
        HStack {
            ForEach(0..<5, id: \.self) { _ in
                Circle()
            }
            MatchMarkers(matches: [.exact, .exact, .inexact, .inexact, .nomatch])
        }.padding()
    }
}
