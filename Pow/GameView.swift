//
//  ContentView.swift
//  Pow
//
//  Created by Romi on 26/03/2023.
//

import SwiftUI

let SECONDS_TO_DEATH = 30
let START_SCORE = 0

struct GameView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var death = SECONDS_TO_DEATH
    @State private var score = START_SCORE
    @State private var size = CGSize.zero
    @State private var currentGame : Minigame? = nil
    
    @ObservedObject var games = MinigameModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Image("unicorn")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .blur(radius: 10)
            Color.white.opacity(0.5).ignoresSafeArea()
            if death > 0 {
                VStack {
                    GeometryReader { proxy in
                        ForEach(games.r.indices, id: \.self) { index in
                            if games.r[index].age > 0 {
                                PowButtonView(
                                    label: games.r[index].ope.label(),
                                        color: games.r[index].ope.color()
                                    )
                                    .offset(games.r[index].offset)
                                    .onTapGesture {
                                        withAnimation() {
                                            currentGame = games.r[index]
                                            games.r[index].age = 0
                                        }
                                    }
                            }
                        }
                        .onReceive(timer) { time in
                            if currentGame == nil {
                                death -= 1
                                if death > 0 {
                                    withAnimation(.easeInOut) {
                                        //decay existing items
                                        games.r.indices.forEach { i in
                                            if (games.r[i].age > 0) {
                                                games.r[i].decay()
                                                
                                            }
                                        }
                                        //insert new items
                                        if games.countAlive() < 6 {
                                            var itemToCreate = Int.random(in: 1...4)
                                            
                                            while itemToCreate > 0 {
                                                let index = games.r.indices.randomElement()!
                                                if games.r[index].age == 0 {
                                                    games.r[index].refresh()
                                                    games.r[index].offset = CGSize(
                                                        width: CGFloat.random(in: 60.0...proxy.size.width-60),
                                                        height: CGFloat.random(in: 80.0...proxy.size.height-80))
                                                    itemToCreate -= 1
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    PowHeaderView(remainingSeconds: death, totalSeconds: 30, score: score)
                }
                .padding()
                
                if (currentGame != nil) {
                    MiniGameView(
                        score: $score,
                        game: $currentGame
                    ).transition(.scale).zIndex(1)
                }
            }
            else {
                VStack(alignment: .center, spacing: 16) {
                    Spacer()
                    Text("PARTIE TERMINEE")
                        .fontShakaPow(20)
                    Spacer()
                    Text("Score \(score)").fontShakaPow(35)
                    Spacer()
                    Button("REJOUER", action: {
                        death = SECONDS_TO_DEATH
                        score = START_SCORE
                        games.reset()
                    }).fontShakaPow(20)
                    Spacer()
                }
                .frame(width: 320, height: 250)
                .background(Color(UIColor.systemBackground))
                .cornerRadius(25)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
