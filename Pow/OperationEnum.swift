//
//  Operation.swift
//  Pow
//
//  Created by Romi on 26/03/2023.
//

import SwiftUI

enum OperationEnum: String {
    case empty,
         add = "+",
         mult = "x",
         sub = "-",
         divide = "/"
    
    func label() -> String {
        switch self {
        case .empty:
            return ""
        case .add:
            return "ADD"
        case .mult:
            return "MULT"
        case .sub:
            return "SUB"
        case .divide:
            return "DIV"
        }
    }
    
    func color() -> Color {
        switch self {
        case .empty:
            return .accentColor.opacity(0)
        case .add:
            return .purple
        case .mult:
            return .green
        case .sub:
            return .yellow
        case .divide:
            return .orange
        }
    }
    
    func compute(_ l: Int, _ r: Int) -> Int {
        switch self {
        case .empty:
            return -1
        case .add:
            return l + r
        case .mult:
            return l * r
        case .sub:
            return l - r
        case .divide:
            return l / r
        }
    }
}
