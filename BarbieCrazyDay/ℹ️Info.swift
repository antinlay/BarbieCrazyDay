//
//  ℹ️Info.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 27.08.2024.
//

import SwiftUI

struct Info: View {
    @EnvironmentObject private var router: Router

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    HomeButon(action: {
                        router.navigate(to: GameViews.menu)
                    })
                        .padding(.leading)
                    Spacer()
                    Wallet()
                        .padding(.trailing)
                }
//                Image(.Info.textBoard)
//                    .overlay {
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text("\nAbout the App")
                                    .font(.dynamo(.regular, size: 25))
                                Text(aboutText + questsText + mountainsText + sunnyDayText + thunderstormText)
                                    .font(.dynamo(.regular, size: 13))
                            }
                            .foregroundStyle(.white)
                        }
                        .boardBackground
                        .padding(.vertical, 6)
                        .padding(.horizontal, 24)
//                    }
                    .alignmentPosition(.bottom)
                    .padding(.bottom)
            }
        }.modifier(AppBackground(.Shop.background))
    }
    
    private var aboutText = """
                        
                        Embark on a thrilling journey through 10 mystical quizzez where each chapter is a step closer to uncovering ancient secrets and facing mythical challenges. This app engaging storyline, interactive decisions, and dynamic weather-themed mini-games.
                        
                        """
    
    private var questsText = """
                            
                            Quests:
                            
                            Each of the 10 quests features a unique plot point.
                            At the end of each chapter, make a decision that impacts the storyline and can reward you with
                            coins.
                            
                            Games:
                            
                            Complete tasks in three mini games related to Snow Mountains, Sunny Day, and Thunderstorm.
                            The required multipliers increase with each level, intensifying the challenges as you progress.
                            
                            Games Descriptions:
                            
                            """
    private var mountainsText = """
                            Snow Mountains
                            
                            Navigate icy slopes to collect snowballs with multiplayer and avoid bombs. The game's difficulty increases from 'Easy' to 'Crazy' as you advance.
                            
                            How to play:
                            
                                1. Select difficulty level before playing.
                                2. Place your bet and click the "Deal" button.
                                3. Start your selection from the bottom row and work your way up.
                                4. If you successfully choose a snowball, you will see the total winning multiplier on the tile. If you choose unsuccessfully and encounter a bomb, the game will end, and your winnings will be lost.
                                5. Don't forget to complete tasks to increase your level to unlock new quests in the 'Quests' section!
                            
                            """
    
    
    private var sunnyDayText = """
                        Sunny Day
                        
                        Sunny Day is a dynamic slot game set under the bright and cheerful theme of a sunny day. The game features a unique mechanism where each reel is spun individually, allowing players to make strategic decisions to maximize their winnings.
                        
                        Tiles: Includes standard JQK, lotus, pot of coins, and a special sun symbol with varying multipliers (from 50 to 1000).
                        
                        How to play:
                        
                            1. Place your bet and click the "Deal" button.
                            2. Press the 'Spin' button to start the first reel. Each reel spins independently, starting from the left.
                            3. After the spin, you can see if any elements (or the special sun symbol) have appeared.
                        
                        Decisions Post-Spin:
                            1. Spin Again: If key symbols appear, you have the option to spin the same reel again to try and gather more key symbols, increasing your potential multiplier.
                            2. Go Next: If you are satisfied with the symbols or want to minimize risks, press 'Go Next' to proceed to the next reel.
                        
                        Accumulating Multipliers: Each reel has a defined
                        multiplier step that increases based on the key
                        symbols collected:
                            • First Reel: x0.25 per key element.
                            • Second Reel: x0.5 per key element.
                            • Continues increasing with each reel.
                        
                        Risk vs. Reward: Each subsequent spin of the same reel offers higher rewards but also increases the risk of losing previously accumulated multipliers if no key symbols appear.
                        
                        Finalizing the Round: After all reels have been spun and decisions made, the total multiplier accumulated is applied to your bet to calculate your winnings.
                        You have the option to claim your winnings or start a new round.
                        """
    
    private var thunderstormText = """
                            Thunderstorm
                            
                            A timing-based game where you must claim your winnings before a lightning strike ends the round. The longer you wait, the higher the multiplier, but risk grows!
                            
                            As the ship glides across the screen, your potential winnings multiply. It's up to you, the player, to decide when to 'save' the ship (i.e., claim your winnings) before it disappears from view, escaping the lightning yourself.
                            
                            The essence of the game lies in the choice of risk and reward. The longer you wait, the higher the potential winnings, but so does the risk of losing it all.
                            
                            How to play:
                            
                                1. Place your bet and click the "Deal" button.
                                2. Decide at what point you want to collect your winnings while the ship is in your sights. To collect your winnings, click the "Take" button.
                                3. Don't forget to complete tasks to increase your level to unlock new quests in the 'Quests' section!
                            
                            Levels:
                            
                            Each level requires you to achieve specific multipliers in the games to advance. Completing these levels will open up new quests for you in the 'Quests' section.
                            
                            Shop:
                            
                            Traveler's Backpack: Buy for a fixed price and receive a random coin reward, ranging anywhere from 100 to
                            5,000 coins.
                            
                            Remember, it's all in good fun - no real money involved. let the whimsy and a touch of strategic mischief guide you through this laughter-serious epic!
                            
                            
                            """
}

#Preview {
    Info()
        .environmentObject(Router())
        .environmentObject(DefaultStorage())
}
