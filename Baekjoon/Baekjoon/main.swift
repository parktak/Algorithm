//
//  main.swift
//  Baekjoon
//
//  Created by 박탁인 on 2025/12/23.
//

import Foundation

/**
 B진법 수 N이 주어진다. 이 수를 10진법으로 바꿔 출력하는 프로그램을 작성하시오.

 10진법을 넘어가는 진법은 숫자로 표시할 수 없는 자리가 있다. 이런 경우에는 다음과 같이 알파벳 대문자를 사용한다.

 A: 10, B: 11, ..., F: 15, ..., Y: 34, Z: 35
 input
 ZZZZZ 36
 
 output
 60466175
 */

let input = readLine()!.split(separator: " ")
let rd = Int(input[1])!
let result = input[0].reduce(0) { r, c in return r * rd + (c.wholeNumberValue ?? Int(c.asciiValue! - 55)) }
print(result)



class chess {

    func sol() {
        let input = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
        let base = [1,1,2,2,2,8]
        print("\(1 - input[0]) \(1 - input[1]) \(2 - input[2]) \(2 - input[3]) \(2 - input[4]) \(8 - input[5])")
    }
}
