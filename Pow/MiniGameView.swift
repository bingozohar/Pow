//
//  MiniGameView.swift
//  Pow
//
//  Created by Romi on 27/03/2023.
//

import SwiftUI

struct MiniGameView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var responseGiven = false
    @State private var remainingTime = 10
    
    @Binding var score: Int
    @Binding var game: Minigame?
    
    var body: some View {
        if (game != nil) {
            let unwrap  = game!
            VStack(alignment: .center, spacing: 16) {
                Spacer()
                HStack {
                    Text("\(unwrap.l)").fontShakaPow(50)
                    Text("\(unwrap.ope.rawValue)").font(.largeTitle)
                    Text("\(unwrap.r)").fontShakaPow(50)
                }
                
                HStack(spacing: 10) {
                    Spacer()
                    ForEach(unwrap.responses, id: \.self) { response in
                        MiniGameResponseView(
                            answer: unwrap.result,
                            displayed: response,
                            score: $score,
                            remainingTime: $remainingTime,
                            responseGiven: $responseGiven)
                    }
                    Spacer()
                }
                if remainingTime > 0 && responseGiven == false {
                    Text("Remaining Time: \(remainingTime)")
                        .fontShakaPow(20)
                }
                else {
                    Text(" ")
                }
                Spacer()
            }
            .frame(width: 320, height: 250)
            .background(Color(UIColor.systemBackground))
            .cornerRadius(15)
            .onReceive(timer) { _ in
                remainingTime -= 1
                if remainingTime == 0 {
                    game = nil
                    /*withAnimation() {
                     showMinigame = false
                     }*/
                }
            }
        }
    }
}

