//
//  BetModel.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 01.09.2024.
//

import SwiftUI

final class BetModel: ObservableObject {
    @AppStorage(DefaultStorage.Key.wallet.rawValue) var wallet = 10_000
    @AppStorage(DefaultStorage.Key.level.rawValue) var level = 1
    @Published var isGameStarted = false
    @Published var bet: Int?
    @Published var multiplyNumber: Double = 0
    @Published var stepSpin: Int = 1
    
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
        } else {
            reset()
        }
    }
    
    func raiseCoefficient(coefficient: Double) {
        if coefficient == 0 {
            reset()
        } else {
            multiplyNumber = coefficient
        }
    }
    
    func deposit(amount: Int) {
        wallet += amount
    }
    
    func withdrawal(amount: Int) {
        wallet -= amount
    }

    
    func reset() {
        isGameStarted = false
        multiplyNumber = 0
        bet = nil
        stepSpin = 1
    }
}
