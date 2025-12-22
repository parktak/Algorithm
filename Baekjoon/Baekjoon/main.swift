//
//  main.swift
//  Baekjoon
//
//  Created by 박탁인 on 2025/12/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let base = [1,1,2,2,2,8]
print("\(1 - input[0]) \(1 - input[1]) \(2 - input[2]) \(2 - input[3]) \(2 - input[4]) \(8 - input[5])")


class chess {

    func sol() {
        let input = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
        let base = [1,1,2,2,2,8]
        print("\(1 - input[0]) \(1 - input[1]) \(2 - input[2]) \(2 - input[3]) \(2 - input[4]) \(8 - input[5])")
    }
}
