//
//  💠Menu.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 24.08.2024.
//

import SwiftUI

struct Menu: View {
    @State private var reward = 500
    @State private var nowReward = 300
    @State private var wallet: Int = 10000
    @State private var dateUntil: Date = .now
    @State private var isDisabledNowReward: Bool = true
    @State private var isDisabledReward: Bool = true
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private var defaultStorage = DefaultStorage()
    
    private var isTimerStopped: Bool { dateUntil < Date.now }
    
    private var infoButton: some View {
        Button {
            // navigate to Info some view
        } label: {
            Image(.Menu.info)
        }
    }
    
    private var amountMoney: some View {
        Image(.Menu.amount)
            .overlay {
                HStack(spacing: 4) {
                    Text("\(wallet)")
                        .font(.cherryBombOne(.regular, size: 15))
                        .foregroundStyle(.accent)
                        .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                    Image(.Menu.almaz)
                }
            }
    }
    
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

    private func getReward() {
        withAnimation {
            if let dateFuture = Calendar.current.date(byAdding: .hour, value: 12, to: .now) {
                defaultStorage.saveRewardModel(RewardModel(dailyDate: dateFuture))
                dateUntil = dateFuture
                wallet += reward
                isDisabledReward = true
            }
        }
    }
    
    private func getRewardNow() {
        withAnimation {
            defaultStorage.saveRewardNowModel(RewardNowModel(nowReward: true))
            wallet += nowReward
            isDisabledNowReward = true
        }
    }
    
    private var timeBoard: some View {
        Image(.Menu.timeBoard)
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
            .overlay {
                VStack(spacing: 0) {
                    HStack(spacing: 1) {
                        Text("\(reward)")
                            .font(.cherryBombOne(.regular, size: 15))
                            .foregroundStyle(.white)
                            .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                        Image(.Menu.almazRounded)
                    }
                    if !isTimerStopped {
                        Text(dateUntil, style: .timer)
                            .font(.cherryBombOne(.regular, size: 12))
                            .foregroundStyle(.white)
                            .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                    }
                }
                .padding(.bottom, 8)
            }
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .trailing) {
                HStack {
                    infoButton
                        .padding(.leading)
                    Spacer()
                    amountMoney
                        .padding(.trailing)
                }
                timeBoard
                    .padding(.trailing)
            }
            .padding(.top, -16)
            .modifier(AlignmentPosition(.topLeading))
            barbie
            HStack(alignment: .bottom) {
                Button {
                    // quests view
                } label: {
                    Image(.Menu.questButton)
                }
                .padding(.bottom, -90)
                Spacer()
                VStack(alignment: .trailing, spacing: 0) {
                    Button {
                        // shop view
                    } label: {
                        Image(.Menu.shopButton)
                    }
                    .padding(.trailing, 10)
                    Button {
                        // games view
                    } label: {
                        Image(.Menu.gamesButton)
                            .overlay(alignment: .bottom) {
                                Image(.Menu.goButton)
                                    .padding(.bottom, -16)
                            }
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, -100)
            levelBoard
        }.modifier(AppBackground(.Menu.background))
            .onReceive(timer) { _ in
                dailyRewardTimer()
                dailyNowRewardTimer()
            }
    }
    
    private var levelBoard: some View {
            Image(.Menu.board)
            .overlay {
                Button {
                    
                } label: {
                    Image(.Menu.question)
                }
                .alignmentPosition(.topTrailing)
                .offset(x: -6, y: -15)
            }
                .alignmentPosition(.bottomLeading)
                .padding(.leading)
    }
        
    private func dailyRewardTimer() {
        withAnimation {
            if let dailyReward = defaultStorage.loadRewardModel(), dailyReward.dailyDate >= Date.now {
                dateUntil = dailyReward.dailyDate
            } else {
                isDisabledReward = false
            }
        }
    }
    
    private func dailyNowRewardTimer() {
        withAnimation {
            if let dailyNowReward = defaultStorage.loadRewardNowModel() {
                isDisabledNowReward = dailyNowReward.nowReward
            } else {
                isDisabledNowReward = false
            }
        }
    }
    
    private var barbie: some View {
        Image(.Menu.barbie)
            .scaleEffect(1.04)
            .modifier(AlignmentPosition(.bottomLeading))
    }
}

#Preview {
    Menu()
}
