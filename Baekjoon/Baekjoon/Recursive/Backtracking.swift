//
//  Backtracking.swift
//  Baekjoon
//
//  Created by 박탁인 on 12/30/25.
//


class Backtracking {
    func sol() {
        
        /**
         문제
         자연수 N과 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.

         1부터 N까지 자연수 중에서 중복 없이 M개를 고른 수열
         입력
         첫째 줄에 자연수 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 8)

         출력
         한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

         수열은 사전 순으로 증가하는 순서로 출력해야 한다.


         */

        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let n = input[0]
        let length = input[1]
        var array = [Int]()
        var visit = Array(repeating: false, count: n + 1)
        func backtracking() {
            if array.count == length {
                print( array.map({ String($0 + 1)}).joined(separator: " "))
                return
            }
            
            for i in 0 ..< n {
                if visit[i] {
                    continue
                }
                array.append(i)
                visit[i] = true
                backtracking()
                
                array.removeLast()
                visit[i] = false
            }
        }

        backtracking()
    }
}
