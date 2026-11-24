//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by Smile on 2026/11/18.
//

import Foundation
import SwiftUI

typealias Peg = Color

extension Peg {
    static let missing = Color.clear
}

struct CodeBreaker {
    var masterCode = Code(kind: .master)
    var guessCode: Code = Code(kind: .guess)
    var attemptsCode: [Code] = []
    var pegChoices: [Peg]

    init(pegChoices: [Peg]) {
        self.pegChoices = pegChoices
        masterCode.randomize(from: pegChoices)
        print(masterCode)
    }
    
    mutating func changeGuessPeg(at idx: Int) {
        let originalPegIdxInChoices = pegChoices.firstIndex(of: guessCode.pegs[idx]) ?? 0
        let newPegIdxInChoices = (originalPegIdxInChoices + 1) % pegChoices.count
        guessCode.pegs[idx] = pegChoices[newPegIdxInChoices]
    }

    mutating func addAttempt() {
        var attemptCode = guessCode
        attemptCode.kind = .attempt(guessCode.match(against: masterCode))
        attemptsCode.append(attemptCode)
    }
}

struct Code {
    var pegs: [Peg] = Array(repeating: .missing, count: 4)
    var kind: Kind? = nil
    
    enum Kind {
        case master
        case guess
        case attempt([Match])
    }
    
    mutating func randomize(from choices: [Peg]) {
        for idx in pegs.indices {
            pegs[idx] = choices.randomElement() ?? Peg.missing
        }
    }

    func match(against code: Code) -> [Match] {
        var result: [Match]  = pegs.indices.map {
            pegs[$0] == code.pegs[$0] ? .exact : .nomatch
        }
        var filteredMasterCode = code.pegs.indices.filter {
            result[$0] != .exact
        }.map {
            code.pegs[$0]
        }

        for i in 0..<result.count where result[i] != .exact {
            if let inExactMatchIdx = filteredMasterCode.firstIndex(of: pegs[i]) {
                filteredMasterCode.remove(at: inExactMatchIdx)
                result[i] = .inexact
            }
        }

        return result
    }
}
