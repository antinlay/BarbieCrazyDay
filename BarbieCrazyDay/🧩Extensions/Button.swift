//
//  Button.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 27.08.2024.
//

import SwiftUI

public struct BetActionButton: View {
    var actionText: String
    var action: () -> Void
    
    public var body: some View {
        Button {
            action()
        } label: {
            Image(.Games.actionButton)
                .overlay(alignment: .top) {
                    Text(actionText)
                        .font(.cherryBombOne(.regular, size: 20))
                        .foregroundStyle(.white)
                        .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                        .padding(.top, 6)
                }
        }
    }
}

public struct BetSpinButton: View {
    var actionText: String
    var action: () -> Void
    
    public var body: some View {
        Button {
            action()
        } label: {
            Image(.SunnyDay.actionButton)
                .overlay(alignment: .top) {
                    Text(actionText)
                        .font(.cherryBombOne(.regular, size: 20))
                        .foregroundStyle(.spinButton)
                        .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                        .padding(.top, 6)
                }
        }
    }
}

public struct BetDealButton: View {
    var actionText: String
    var action: () -> Void
    
    public var body: some View {
        Button {
            action()
        } label: {
            Image(.SunnyDay.dealButton)
                .overlay {
                    Text(actionText)
                        .font(.cherryBombOne(.regular, size: 20))
                        .foregroundStyle(.white)
                        .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                }
        }
    }
}

public struct BetTakeButton: View {
    var action: () -> Void
    
    public var body: some View {
        Button {
            action()
        } label: {
            Image(.SunnyDay.takeButton)
        }
    }
}


public struct HomeButon: View {
    var action: () -> Void
    
    public var body: some View {
        Button(action: action) { Image(.Quests.homeButton) }
    }
}

public struct LongHomeButon: View {
    var action: () -> Void
    
    public var body: some View {
        Button(action: action) { Image(.Mountains.homeButton) }
    }
}

public struct InfoButton: View {
    var action: () -> Void
    
    public var body: some View {
        Button(action: action) { Image(.Menu.infoButton) }
    }
}

public struct ContinueButton: View {
    var action: () -> Void
    
    public var body: some View {
        Button(action: action) { Image(.Stories.continueButton) }
    }
}

public struct SheetContinueButton: View {
    var action: () -> Void
    
    public var body: some View {
        Button(action: action) { Image(.Thunderstorm.continueButton) }
    }
}

public struct SheetHowToButton: View {
    var action: () -> Void
    
    public var body: some View {
        Button(action: action) { Image(.Thunderstorm.howToButton) }
    }
}

public struct SheetHomeButton: View {
    var action: () -> Void
    
    public var body: some View {
        Button(action: action) { Image(.Thunderstorm.homeButton) }
    }
}

public struct PauseButton: View {
    var action: () -> Void
    
    public var body: some View {
        Button(action: action) { Image(.Stories.pauseButton) }
    }
}

public struct ChooseOneButton: View {
    var action: () -> Void
    
    public var body: some View {
        Button(action: action) { Image(.Stories.chooseOneButton) }
    }
}
