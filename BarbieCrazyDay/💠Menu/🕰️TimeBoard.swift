//
//  🕰️TimeBoard.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 27.08.2024.
//

import SwiftUI

struct TimeBoard: View {
    @AppStorage(DefaultStorage.Key.wallet.rawValue) private var wallet = 10_000
    @EnvironmentObject private var defaultStorage: DefaultStorage
    @State private var dateUntil: Date = .now
    @State private var isDisabledNowReward: Bool = true
    @State private var isDisabledReward: Bool = true
    private var reward = 500
    private var nowReward = 300
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private var isTimerStopped: Bool { dateUntil < Date.now }
    
    private var takeButton: some View {
        Button {
            getReward()
        } label: {
            Image(.Menu.takeNowButton)
                .overlay {
                    Text("TAKE")
                        .font(.cherryBombOne(.regular, size: 9))
                        .foregroundStyle(.white)
                        .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                }
        }
        .disabled(isDisabledReward)
        .opacity(isDisabledReward ? .zero : 1)
    }
    
    private var takeNowButton: some View {
        Button {
            getRewardNow()
        } label: {
            Image(.Menu.takeNowButton)
                .overlay {
                    VStack(spacing: -3) {
                        Text("TAKE NOW")
                            .font(.cherryBombOne(.regular, size: 9))
                            .foregroundStyle(.white)
                            .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                        HStack(spacing: 2) {
                            Text("\(nowReward)")
                                .font(.cherryBombOne(.regular, size: 10))
                                .foregroundStyle(.white)
                                .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                            Image(.Menu.almazMini)
                        }
                    }
                    .padding(.bottom, 3)
                }
        }
        .disabled(isDisabledNowReward)
        .opacity(isDisabledNowReward ? .zero : 1)
    }
    
    
    private var timeBoard: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(spacing: 1) {
                    Text(reward, format: .number)
                        .font(.cherryBombOne(.regular, size: 15))
                        .foregroundStyle(.white)
                        .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                    Image(.Menu.almazRounded)
                }
                .padding(.top, 13)
                .padding(.horizontal, 28)
                if !isTimerStopped {
                    Text(dateUntil, style: .timer)
                        .font(.cherryBombOne(.regular, size: 12))
                        .foregroundStyle(.white)
                        .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                }
            }
            .padding(.bottom, 28)
        }
        .timeBoardBackground
        .overlay(alignment: .bottom) {
            Group {
                switch isTimerStopped {
                case true:
                    takeButton
                case false:
                    takeNowButton
                }
            }
            .padding(.bottom, -16)

        }
    }
    
    var body: some View {
        timeBoard
            .onReceive(timer) { _ in
                dailyRewardTimer()
                dailyNowRewardTimer()
            }
    }
    
    private func getReward() {
        if let dateFuture = Calendar.current.date(byAdding: .hour, value: 12, to: .now) {
            defaultStorage.rewardDate = dateFuture
            dateUntil = dateFuture
            wallet += reward
            isDisabledReward = true
        }
    }
    
    private func getRewardNow() {
        defaultStorage.nowReward = true
        wallet += nowReward
        isDisabledNowReward = true
    }
    
    private func dailyRewardTimer() {
        withAnimation {
            if defaultStorage.rewardDate >= Date.now {
                dateUntil = defaultStorage.rewardDate
            } else {
                isDisabledReward = false
            }
        }
    }
    
    private func dailyNowRewardTimer() {
        withAnimation {
            isDisabledNowReward = defaultStorage.nowReward
        }
    }
    
    
}

#Preview {
    TimeBoard()
}
