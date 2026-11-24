//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by Smile on 2026/11/18.
//

import Foundation
import SwiftUI

typealias Peg = Color

struct CodeBreaker {
    var masterCode = Code(pegs: [.red, .blue, .red, .green], kind: .master)
    var guessCode: Code = Code(pegs: [.blue, .red, .green, .red], kind: .guess)
    var attempts: [Code] = []
    var pegChoices: [Peg] = [.red, .blue, .green, .yellow, .brown]
    
    mutating func changeGuessPeg(at idx: Int) {
        let originalPegIdxInChoices = pegChoices.firstIndex(of: guessCode.pegs[idx]) ?? 0
        let newPegIdxInChoices = (originalPegIdxInChoices + 1) % pegChoices.count
        guessCode.pegs[idx] = pegChoices[newPegIdxInChoices]
    }

    mutating func addAttempt() {
        var attemptCode = guessCode
        attemptCode.kind = .attempt
        attempts.append(attemptCode)
    }
}

struct Code {
    var pegs: [Peg]
    var kind: Kind? = nil
    
    enum Kind {
        case master
        case guess
        case attempt
    }
}
