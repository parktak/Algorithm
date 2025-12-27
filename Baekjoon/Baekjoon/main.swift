//
//  main.swift
//  Baekjoon
//
//  Created by 박탁인 on 2025/12/23.
//

import Foundation

class Baekjoon {
    
    func sol() {
        
        /**
         알파벳 대소문자로 된 단어가 주어지면, 이 단어에서 가장 많이 사용된 알파벳이 무엇인지 알아내는 프로그램을 작성하시오. 단, 대문자와 소문자를 구분하지 않는다.
         첫째 줄에 알파벳 대소문자로 이루어진 단어가 주어진다. 주어지는 단어의 길이는 1,000,000을 넘지 않는다.
         첫째 줄에 이 단어에서 가장 많이 사용된 알파벳을 대문자로 출력한다. 단, 가장 많이 사용된 알파벳이 여러 개 존재하는 경우에는 ?를 출력한다.
         */

        let input = readLine()!.uppercased()
        var dict = [String.Element: Int]()
        var max = 0
        input.forEach { char in
            if dict[char] == nil {
                dict[char] = 1
            } else {
                dict[char]! += 1
            }
            if max <= dict[char]! {
                max = dict[char]!
            }
        }
        let result = dict.filter { $0.value == max }.keys
        print(result.count == 1 ? String(result.first!) : "?")

    }
    
    func gptSol() {
        
        /**
         알파벳 대소문자로 된 단어가 주어지면, 이 단어에서 가장 많이 사용된 알파벳이 무엇인지 알아내는 프로그램을 작성하시오. 단, 대문자와 소문자를 구분하지 않는다.
         첫째 줄에 알파벳 대소문자로 이루어진 단어가 주어진다. 주어지는 단어의 길이는 1,000,000을 넘지 않는다.
         첫째 줄에 이 단어에서 가장 많이 사용된 알파벳을 대문자로 출력한다. 단, 가장 많이 사용된 알파벳이 여러 개 존재하는 경우에는 ?를 출력한다.
         */

        let input = readLine()!
        var array = Array(repeating: 0, count: 26)
        var max = 0

        for byte in input.utf8 {
            // 대문자
            if byte >= 65 && byte <= 90 {
                array[Int(byte - 65)] += 1
            } else {
                array[Int(byte - 97)] += 1
            }
        }

        var maxIndex = -1
        var duplicated = false
        for i in 0..<26 {
            if array[i] > max {
                max = array[i]
                maxIndex = i
                duplicated = false
            } else if array[i] == max && max != 0 {
                duplicated = true
            }
        }

        print(duplicated ? "?" : String(UnicodeScalar(maxIndex + 65)!))


    }
}
class chess {

    func sol() {
        let input = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
        let base = [1,1,2,2,2,8]
        print("\(1 - input[0]) \(1 - input[1]) \(2 - input[2]) \(2 - input[3]) \(2 - input[4]) \(8 - input[5])")
    }
}
