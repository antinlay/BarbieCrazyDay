//
//  💠Menu.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 24.08.2024.
//

import SwiftUI

struct Menu: View {
    @State private var dailyReward = 500
    @State private var nowReward = 300
    @State private var wallet: Int = 10000
    @State private var dateUntil: Date?
    @State private var isDisabled: Bool = false
    
    private var defaultStorage = DefaultStorage()
    
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
    
    private var takeNowButton: some View {
        Button {
            if let dateFuture = Calendar.current.date(byAdding: .hour, value: 14, to: .now) {
                defaultStorage.saveDate(dateFuture)
                dateUntil = defaultStorage.loadDate()
                wallet += nowReward
            }
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
        .disabled(isDisabled)
        .onChange(of: dateUntil) { newValue in
            let components = Calendar.current.dateComponents([.hour], from: .now, to: defaultStorage.loadDate() ?? .now)
            print(components.hour)
            isDisabled = components.hour ?? 0 > 12
        }
    }
    
    private var timeBoard: some View {
        Image(.Menu.timeBoard)
            .overlay(alignment: .bottom) {
                takeNowButton
                    .padding(.bottom, -16)
            }
            .overlay {
                VStack(spacing: 0) {
                    HStack(spacing: 1) {
                        Text("\(dailyReward)")
                            .font(.cherryBombOne(.regular, size: 15))
                            .foregroundStyle(.white)
                            .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                        Image(.Menu.almazRounded)
                    }
                    if let dateUntil = dateUntil {
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
                    Group {
                        infoButton
                            .padding(.leading)
                        Spacer()
                        amountMoney
                            .padding(.trailing)
                    }
                }
                timeBoard
                    .padding(.trailing)
            }
            .padding(.top, -16)
            .modifier(AlignmentPosition(.topLeading))
            barbie
        }.modifier(AppBackground(.Menu.background))
            .onAppear {
                dateUntil = defaultStorage.loadDate()
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
