//
//  PowButtonView.swift
//  Pow
//
//  Created by Romi on 27/03/2023.
//

import SwiftUI

struct PowButtonView : View {
    let label: String
    let color: Color
    
    var body: some View {
        Text(label)
            .fontShakaPow(20)
            .foregroundColor(.white)
            .bold()
            .frame(width: 100, height: 100)
            .background(
                InkShape().foregroundColor(color)
            )
    }
}

