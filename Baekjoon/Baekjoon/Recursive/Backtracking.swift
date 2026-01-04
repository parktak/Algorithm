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

class DevideANdSum {
    func sol() {
        
        /**
         어떤 자연수 N이 있을 때, 그 자연수 N의 분해합은 N과 N을 이루는 각 자리수의 합을 의미한다. 어떤 자연수 M의 분해합이 N인 경우, M을 N의 생성자라 한다. 예를 들어, 245의 분해합은 256(=245+2+4+5)이 된다. 따라서 245는 256의 생성자가 된다. 물론, 어떤 자연수의 경우에는 생성자가 없을 수도 있다. 반대로, 생성자가 여러 개인 자연수도 있을 수 있다.

         자연수 N이 주어졌을 때, N의 가장 작은 생성자를 구해내는 프로그램을 작성하시오.
         */

        let n = Int(readLine()!)!
        var min = 0
        var j = 0
        var sum = 0
        
        for i in 1 ..< n {
            j = i
            sum = i
            
            while j > 0 {
                sum += j % 10
                j /= 10
            }
            if sum == n {
                min = i
                break
            }
        }
        print(min)

    }
}
