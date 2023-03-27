//
//  PowUtils.swift
//  Pow
//
//  Created by Romi on 27/03/2023.
//

import SwiftUI

extension View {
    func fontShakaPow(_ size: CGFloat) -> some View {
        self.font(.custom("Shaka Pow", size: size))
    }
}

extension Int {
    static func random() -> Int {
        return Int.random(in: 1..<9)
    }
    
    static func getUniqueRandoms(min: Int = 0, max: Int, count: Int) -> [Int] {
        var set = Set<Int>()
        while set.count < count {
            set.insert(Int.random(in: min...max))
        }
        return Array(set)
    }
}
