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
        let totalMarkers = (matches.count + 1) / 2 * 2
        VStack {
            HStack {
                ForEach(0..<totalMarkers / 2, id: \.self) { idx in
                    matchMarker(with: idx)
                }
            }
            HStack {
                ForEach(totalMarkers / 2..<totalMarkers, id: \.self) { idx in
                    matchMarker(with: idx)
                }
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

enum Match {
    case nomatch
    case inexact
    case exact
}

#Preview {
    VStack {
        HStack {
            ForEach(0..<3, id: \.self) { _ in
                Circle()
            }
            MatchMarkers(matches: [.exact, .inexact, .inexact])
        }
        HStack {
            ForEach(0..<3, id: \.self) { _ in
                Circle()
            }
            MatchMarkers(matches: [.exact, .nomatch, .nomatch])
        }
        HStack {
            ForEach(0..<4, id: \.self) { _ in
                Circle()
            }
            MatchMarkers(matches: [.exact, .exact, .inexact, .inexact])
        }
        HStack {
            ForEach(0..<5, id: \.self) { _ in
                Circle()
            }
            MatchMarkers(matches: [.exact, .exact, .inexact, .inexact, .nomatch])
        }
        HStack {
            ForEach(0..<6, id: \.self) { _ in
                Circle()
            }
            MatchMarkers(matches: [.exact, .exact, .inexact, .inexact, .exact, .exact])
        }
    }.padding()
}
