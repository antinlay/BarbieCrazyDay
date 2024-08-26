//
//  DefaultStorage.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 25.08.2024.
//

import Foundation

struct RewardModel: Codable {
    var dailyDate: Date
}

struct RewardNowModel: Codable {
    var nowReward: Bool
}

class DefaultStorage {
    private let defaults = UserDefaults.standard
    
    func getStructName<T>(_ instance: T) -> String {
        let mirror = Mirror(reflecting: instance)
        return String(describing: mirror.subjectType)
    }

    func saveRewardModel(_ rewardModel: RewardModel) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(rewardModel) {
            defaults.set(encoded, forKey: "RewardModel")
        }
    }
    
    func saveRewardNowModel(_ rewardNowModel: RewardNowModel) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(rewardNowModel) {
            defaults.set(encoded, forKey: "RewardNowModel")
        }
    }

    func loadRewardModel() -> RewardModel? {
        if let savedData = defaults.object(forKey: "RewardModel") as? Data {
            let decoder = JSONDecoder()
            if let loadedDateModel = try? decoder.decode(RewardModel.self, from: savedData) {
                return loadedDateModel
            }
        }
        return nil
    }
    
    func loadRewardNowModel() -> RewardNowModel? {
        if let savedData = defaults.object(forKey: "RewardNowModel") as? Data {
            let decoder = JSONDecoder()
            if let loadedDateModel = try? decoder.decode(RewardNowModel.self, from: savedData) {
                return loadedDateModel
            }
        }
        return nil
    }

}
