//
//  File.swift
//  Pow
//
//  Created by Romi on 26/03/2023.
//

import Foundation

class MinigameModel: ObservableObject {
    @Published var r = [Minigame]()
    
    init() {
        reset()
    }
    
    func reset() {
        r.removeAll()
        for _ in (0..<18) {
            r.append(Minigame())
        }
        /*let itemToShow = Int.getUniqueRandoms(max: 15, count: 3)
        for index in itemToShow {
            //refreshMiniGame(mini: &r[index])
            r[index].refresh()
        }*/
    }
    
    func countAlive() -> Int {
        return r.filter { minigame in
            return minigame.age > 0
        }.count
    }
}
