//
//  Minigame.swift
//  Pow
//
//  Created by Romi on 26/03/2023.
//

import Foundation

struct Minigame: Identifiable {
    var id = UUID()
    var l: Int = 0
    var r: Int = 0
    var ope: OperationEnum = OperationEnum.empty
    var age: Int = 0
    var result: Int = 0
    var responses: [Int] = []
    var offset: CGSize = CGSize.zero
    
    static let operationProbability = [
        OperationEnum.add,
        OperationEnum.add,
        OperationEnum.add,
        OperationEnum.add,
        OperationEnum.sub,
        OperationEnum.sub,
        OperationEnum.sub,
        OperationEnum.mult,
        OperationEnum.mult,
        OperationEnum.mult
    ]
    
    mutating func refresh() {
        l = Int.random()
        r = Int.random()
        age = Int.random(in: 5...9)
        ope = Minigame.operationProbability.randomElement()!
        result = ope.compute(l, r)
        let range = (result-3...result+3).filter {
            $0 != result
        }.shuffled()[...2]
        responses = [result, range[0], range[1], range[2]].shuffled()
    }
    
    mutating func decay() {
        age -= 1
    }
}
