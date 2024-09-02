//
//  BetModel.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 01.09.2024.
//

import SwiftUI

final class BetModel: ObservableObject {
    @AppStorage(DefaultStorage.Key.wallet.rawValue) private var wallet = 10_000
    @AppStorage(DefaultStorage.Key.level.rawValue) private var level = 1
    @Published var isGameStarted = false
    @Published var bet: Int?
    @Published var multiplyNumber: Double = 0
    
    var minBet = 1000
    var maxBet = 10_000
    
    var currentWinning: Int { Int(Double(bet!) * multiplyNumber * Double(level) * 1.5) }
    
    func takeButtonPressed() {
        wallet += currentWinning
        reset()
    }
    
    func dealButtonPressed() {
        if let bet = bet, bet <= wallet {
            wallet -= bet
            isGameStarted = true
        }
    }
    
    func raiseCoefficient(coefficient: Double) {
        if coefficient == 0 {
            reset()
        } else {
            multiplyNumber = coefficient
        }
    }
    
    func reset() {
        isGameStarted = false
        multiplyNumber = 0
        bet = nil
    }
}
