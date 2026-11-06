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
        HStack {
            VStack {
                matchMarker(with: 0)
                matchMarker(with: 1)
            }
            VStack {
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

enum Match {
    case nomatch
    case inexact
    case exact
}

#Preview {
    VStack {
//        HStack {
//            ForEach(0..<3, id: \.self) { _ in
//                Circle()
//            }
//            MatchMarkers(matches: [.exact, .inexact, .inexact, .nomatch])
//        }
//        HStack {
//            ForEach(0..<3, id: \.self) { _ in
//                Circle()
//            }
//            MatchMarkers(matches: [.exact, .nomatch, .nomatch, .nomatch])
//        }
        HStack {
            ForEach(0..<4, id: \.self) { _ in
                Circle()
            }
            MatchMarkers(matches: [.exact, .exact, .inexact, .inexact])
        }
//        HStack {
//            ForEach(0..<6, id: \.self) { _ in
//                Circle()
//            }
//            MatchMarkers(matches: [.exact, .exact, .inexact, .inexact])
//        }
    }.padding()
}
