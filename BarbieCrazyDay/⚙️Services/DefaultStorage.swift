//
//  DefaultStorage.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 25.08.2024.
//

import Foundation

struct DateModel: Codable {
    var date: Date
}

class DefaultStorage {
    private let key = "DateModelKey"
    private let defaults = UserDefaults.standard

    func saveDate(_ date: Date) {
        let dateModel = DateModel(date: date)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(dateModel) {
            defaults.set(encoded, forKey: key)
        }
    }

    func loadDate() -> Date? {
        if let savedDate = defaults.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let loadedDateModel = try? decoder.decode(DateModel.self, from: savedDate) {
                return loadedDateModel.date
            }
        }
        return nil
    }
}
