//
//  Programmers.swift
//  Baekjoon
//
//  Created by 박탁인 on 1/5/26.
//

import Foundation

class Programmers {
    
    func sol() {
        
        //let players = [0, 2, 3, 3, 1, 2, 0, 0, 0, 0, 4, 2, 0, 6, 0, 4, 2, 13, 3, 5, 10, 0, 1, 5]
        //let m = 3
        //let k = 5

        let players = [0, 0, 0, 10, 0, 12, 0, 15, 0, 1, 0, 1, 0, 0, 0, 5, 0, 0, 11, 0, 8, 0, 0, 0]
        let m = 5
        let k = 1
        let cote = Programmers()
        let a = cote.solution(players, m, k)

        print(a)
    }
    
    func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
        var count = 0
        var servers = Array(Array(repeating: 0, count: 24))
        var availableUsers = m - 1
        players.enumerated().forEach { index, player in
            if index - k >= 0 {
                availableUsers -= servers[index - k]
            }
            
            let notEnough = player - availableUsers
            if notEnough > 0 {
                let addCount = Int(ceil( Float(notEnough) / Float(m)))
                availableUsers += (addCount * m)
                servers[index] = (addCount * m)
                count += addCount
            }
        }
        
        return count
    }
}
