//
//  Formation.swift
//  Baekjoon
//
//  Created by 박탁인 on 12/23/25.
//

import Foundation

class Formation {
    /**
     
     10진법 수 N이 주어진다. 이 수를 B진법으로 바꿔 출력하는 프로그램을 작성하시오.

     10진법을 넘어가는 진법은 숫자로 표시할 수 없는 자리가 있다. 이런 경우에는 다음과 같이 알파벳 대문자를 사용한다.

     input
     A: 10, B: 11, ..., F: 15, ..., Y: 34, Z: 35
     
     output
     60466175 36
     */
    
    func _10ToN() {
        let input = readLine()!.split(separator: " ")
        let rd = Int(input[1])!
        var num = Int(input[0])!
        var result = ""
        let c =  Character("A").asciiValue!
        while true {
            let mod = num % rd
            if mod < 10 {
                result += String(mod)
            } else {
                
                result += String(UnicodeScalar(c + UInt8(mod - 10)))
            }
            num /= rd
            if num == 0 { break }
        }
        print(String(result.reversed()))
    }
    
    func _10ToN_More() {
        let input = readLine()!.split(separator: " ")
        let rd = Int(input[1])!
        var num = Int(input[0])!
        var result = [Character]()
        
        while num > 0 {
            let mod = num % rd
            if mod < 10 {
                result.append(Character(UnicodeScalar(48 + mod)!)) // 48 = 0
            } else {
                result.append(Character(UnicodeScalar(55 + mod)!)) // 55 = a
            }
            num /= rd
        }
        
        print(String(result.reversed()))
    }
    
    
    /**
     B진법 수 N이 주어진다. 이 수를 10진법으로 바꿔 출력하는 프로그램을 작성하시오.

     10진법을 넘어가는 진법은 숫자로 표시할 수 없는 자리가 있다. 이런 경우에는 다음과 같이 알파벳 대문자를 사용한다.

     A: 10, B: 11, ..., F: 15, ..., Y: 34, Z: 35
     input
     ZZZZZ 36
     
     output
     60466175
     */
    func nTo10() {
        let input = readLine()!.split(separator: " ")
        let rd = Int(input[1])!
        let result = input[0].reduce(0) { r, c in return r * rd + (c.wholeNumberValue ?? Int(c.asciiValue! - 55)) }
        print(result)
    }
}
