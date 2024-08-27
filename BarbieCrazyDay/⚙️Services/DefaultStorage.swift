//
//  DefaultStorage.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 25.08.2024.
//

import Foundation

extension DefaultStorage {
    enum Key: String {
        case welcome = "WelcomeShowed"
        case wallet = "AmountCoins"
        case reward = "DailyReward"
        case nowReward = "NowReward"
        case level = "CurrentLevel"
        case available = "AvailableQuests"
        case complete = "CompletedQuests"
    }
}

class DefaultStorage {
    private let defaults = UserDefaults.standard
    
    var isWelcomeShowed: Bool {
        get { defaults.bool(forKey: Key.welcome.rawValue) }
        set { defaults.set(newValue, forKey: Key.welcome.rawValue) }
    }
    
    var rewardDate: Date {
        get { defaults.object(forKey: Key.reward.rawValue) as? Date ?? .now }
        set {
            defaults.set(newValue, forKey: Key.reward.rawValue)
            defaults.set(false, forKey: Key.nowReward.rawValue)
        }
    }
    
    var nowReward: Bool {
        get { defaults.bool(forKey: Key.nowReward.rawValue) }
        set { defaults.set(newValue, forKey: Key.nowReward.rawValue) }
    }
    
    var level: Int {
        get { defaults.object(forKey: Key.level.rawValue) as? Int ?? 1 }
        set { defaults.set(newValue, forKey: Key.level.rawValue) }
    }
    
    var availableQuests: [Int] {
        get { defaults.object(forKey: Key.available.rawValue) as? [Int] ?? [1] }
        set { defaults.set(newValue, forKey: Key.available.rawValue) }
    }
    
    var completedQuests: [Int] {
        get { defaults.object(forKey: Key.complete.rawValue) as? [Int] ?? [1] }
        set { defaults.set(newValue, forKey: Key.complete.rawValue) }
    }

}
