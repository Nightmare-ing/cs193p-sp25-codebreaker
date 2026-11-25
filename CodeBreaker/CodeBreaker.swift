//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by Smile on 2026/11/18.
//

import Foundation


struct CodeBreaker {
    var numberOfPegs = 4
    var masterCode: Code
    var guessCode: Code
    var attemptCodes: [Code] = []
    var pegChoices: [Peg]

    init(pegChoices: [Peg]) {
        self.pegChoices = pegChoices
        numberOfPegs = Int.random(in: 3...6)
        masterCode = Code(kind: .master, numOfPegs: numberOfPegs)
        masterCode.randomize(from: pegChoices)
        guessCode = Code(kind: .guess, numOfPegs: numberOfPegs)
        print(masterCode)
    }
    
    mutating func changeGuessPeg(at idx: Int) {
        let originalPegIdxInChoices = pegChoices.firstIndex(of: guessCode.pegs[idx]) ?? 0
        let newPegIdxInChoices = (originalPegIdxInChoices + 1) % pegChoices.count
        guessCode.pegs[idx] = pegChoices[newPegIdxInChoices]
    }

    mutating func addAttempt() {
        var attempt = guessCode
        attempt.kind = .attempt(guessCode.match(against: masterCode))
        if !attempt.pegs.allSatisfy({ $0 == .missing }), !attemptCodes.contains(attempt) {
            attemptCodes.append(attempt)
        }
    }

    mutating func restartGame() {
        self = CodeBreaker(pegChoices: pegChoices)
    }
}

struct Peg: Equatable {
    var content: String
    static let missing = Peg(content: ".missing")
}

struct Code: Equatable {
    var pegs: [Peg] = Array(repeating: .missing, count: 4)
    var kind: Kind? = nil
    
    enum Kind: Equatable {
        case master
        case guess
        case attempt([Match])
    }
    
    init(pegs: [Peg]) {
        self.pegs = pegs
    }
    
    init(pegs: [Peg], kind: Kind) {
        self.pegs = pegs
    }

    init(kind: Kind, numOfPegs: Int) {
        pegs = Array(repeating: .missing, count: numOfPegs)
        self.kind = kind
    }
    
    mutating func randomize(from choices: [Peg]) {
        for idx in pegs.indices {
            pegs[idx] = choices.randomElement() ?? Peg.missing
        }
    }
    
    mutating func clearAll() {
        pegs = Array(repeating: .missing, count: pegs.count)
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
