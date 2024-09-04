//
//  SunnyDayCases.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 03.09.2024.
//

import SwiftUI

enum SunnyDayCases: CaseIterable {
    case first, second, third, fourth, fifth
    
    var score: ImageResource {
        switch self {
        case .first:
                .SunnyDay.bombScore
        case .second:
                .SunnyDay.brilliantScore
        case .third:
                .SunnyDay.orangeScore
        case .fourth:
                .SunnyDay.emeraldScore
        case .fifth:
                .SunnyDay.loveScore
        }
    }
    
    var item: ImageResource {
        switch self {
        case .first:
                .SunnyDay.bomb
        case .second:
                .SunnyDay.brilliant
        case .third:
                .SunnyDay.orange
        case .fourth:
                .SunnyDay.emerald
        case .fifth:
                .SunnyDay.love
        }
    }
    
    var coefficient: Double {
        switch self {
        case .first:
            0.25
        case .second:
            0.5
        case .third:
            1
        case .fourth:
            2
        case .fifth:
            5
        }
    }
    
    var next: SunnyDayCases {
        if let index = SunnyDayCases.allCases.firstIndex(of: self), index < SunnyDayCases.allCases.count - 1 {
            return SunnyDayCases.allCases[index + 1]
        }
        return self
    }

    var step: Int {
        switch self {
        case .first:
            1
        case .second:
            2
        case .third:
            3
        case .fourth:
            4
        case .fifth:
            5
        }
    }
}
