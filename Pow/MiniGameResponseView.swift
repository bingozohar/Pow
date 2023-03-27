//
//  MiniGameResponseView.swift
//  Pow
//
//  Created by Romi on 27/03/2023.
//

import SwiftUI

struct MiniGameResponseView: View {
    let answer: Int
    let displayed: Int
    
    @State private var color = Color.gray
    
    @Binding var score: Int
    @Binding var remainingTime: Int
    @Binding var responseGiven: Bool
    
    var body: some View {
        Text(String(displayed))
            .fontShakaPow(36)
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 0, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(
                RoundedRectangle(cornerRadius: 4.0)
                    .foregroundColor(self.color)
                    .aspectRatio(1.0, contentMode: ContentMode.fit)
            ).onTapGesture {
                withAnimation() {
                    if displayed == answer {
                        score += answer
                        color = Color.green
                    }
                    else {
                        color = Color.red
                    }
                    remainingTime = 2
                    responseGiven = true
                }
            }
    }
}
