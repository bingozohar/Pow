//
//  PowHeader.swift
//  Pow
//
//  Created by Romi on 27/03/2023.
//

import SwiftUI

struct PowHeaderView: View {
    var remainingSeconds: Int
    var totalSeconds: Int
    var score: Int
    
    private var progress: Double {
        return Double(remainingSeconds) / Double(totalSeconds)
    }
    
    var body: some View {
        HStack {
            ProgressView(value: progress).tint(.white)
            Text("| Score: \(score)")
                .foregroundColor(Color.white)
                .fontShakaPow(20)
                .bold()
        }
        .padding()
    }
}

struct PowHeader_Previews: PreviewProvider {
    static var previews: some View {
        PowHeaderView(remainingSeconds: 30, totalSeconds: 60, score: 10)
    }
}
