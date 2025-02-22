//
//  Travel.swift
//  LeetCode
//
//  Created by 박탁인 on 2025/02/22.
//

import Foundation

class Travel {
    var result = [String]()
    
    func solution(_ tickets:[[String]]) -> [String] {
        
        let visited = [Bool](repeating: false, count: tickets.count)
        let departure = "ICN"
        result.append(departure)
        _ = dfs(departure, visited, tickets, 0)
        
        return result
    }
    
    func dfs(_ departure: String,_ visited: [Bool],_ tickets: [[String]],_ depth: Int) -> Bool {
        
        if depth == tickets.count { return true }
        
        var tVisited = visited
        var festest = [Int: String]()
        
        // 출발지 -> 목적지 맞는 것들을 다 찾음
        tickets.enumerated().forEach { i , ticket in
            if visited[i] { return }
            if ticket[0] != departure { return }
            
            let destination = ticket[1]
            
            festest[i] = destination
        }
        
        if festest.isEmpty {    // 없다면 false
            return false
        }
        
        // 문제 조건에 따라 알파벳 우선순위 정렬
        let sorted = festest.sorted(by: { $0.value < $1.value})
        
        for data in sorted {
            if tVisited[data.key] { continue }
            tVisited[data.key] = true
            
            result.append(data.value)
            if dfs(data.value, tVisited, tickets, depth+1) {
                return true
            }
            
            result.removeLast()
            tVisited[data.key] = false
        }
        
        return false
    }
}
