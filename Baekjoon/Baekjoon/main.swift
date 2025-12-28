//
//  main.swift
//  Baekjoon
//
//  Created by 박탁인 on 2025/12/23.
//

//import Foundation


/**
 2012년 12월 31일 새벽 4시부터 지상파 아날로그 TV방송이 종료되었다. TV를 자주보는 할머니를 위해서, 상근이네 집도 디지털 수신기를 구입했다.

 원래 상근이네 집에는 KBS1과 KBS2만 나왔다. 할머니는 두 방송만 시청한다. 이제 디지털 수신기와 함께 엄청난 양의 채널을 볼 수 있게 되었다.  하지만, 할머니는 오직 KBS1과 KBS2만 보려고 한다. 따라서, 상근이는 채널 리스트를 조절해 KBS1을 첫 번째로, KBS2를 두 번째로 만들려고 한다.

 티비를 켜면 디지털 수신기는 시청 가능한 채널 리스트를 보여준다. 모든 채널의 이름은 서로 다르고, 항상 KBS1과 KBS2를 포함하고 있다. 상근이는 이 리모콘을 이용해서 리스트의 순서를 바꾸는 법을 알아냈다. 리스트의 왼편에는 작은 화살표가 있고, 이 화살표는 현재 선택한 채널을 나타낸다. 가장 처음에 화살표는 제일 첫 번째 채널을 가리키고 있다.

 다음과 같은 네 가지 버튼을 이용해서 리스트의 순서를 바꿀 수 있다. 각각은 1번부터 4번까지 번호가 적혀져있는 버튼이다.

 1. 화살표를 한 칸 아래로 내린다. (채널 i에서 i+1로)
 2. 화살표를 위로 한 칸 올린다. (채널 i에서 i-1로)
 3. 현재 선택한 채널을 한 칸 아래로 내린다. (채널 i와 i+1의 위치를 바꾼다. 화살표는 i+1을 가리키고 있는다)
 4. 현재 선택한 채널을 위로 한 칸 올린다. (채널 i와 i-1의 위치를 바꾼다. 화살표는 i-1을 가리키고 있다)
 화살표가 채널 리스트의 범위를 넘어간다면, 그 명령은 무시한다.

 현재 채널 리스트의 순서가 주어졌을 때, KBS1를 첫 번째로, KBS2를 두 번째로 순서를 바꾸는 방법을 구하는 프로그램을 작성하시오. 방법의 길이는 500보다 작아야 한다. 두 채널을 제외한 나머지 채널의 순서는 상관없다.
 input
 3
 MBC
 KBS1
 KBS2
 output 33
 */
let n = Int(readLine()!)!
var result = ""
var array = [String]()
var kbs1 = -1
var kbs2 = -1
for i in 0 ..< n {
    let name = readLine()!
    array.append(name)
    if name == "KBS1" {
        kbs1 = i
    } else if name == "KBS2" {
        kbs2 = i
    }
}
result += Array(repeating: "1", count: kbs1)
result += Array(repeating: "4", count: kbs1)

if kbs1 > kbs2 {
    kbs2 += 1
}
result += Array(repeating: "1", count: kbs2)
result += Array(repeating: "4", count: kbs2 - 1)

print(result)
/*
var k1 = kbs1 == 0
var k2 = kbs2 == 1
var target = kbs1
var goal = 0
var cicle = 0
var current = 0
while !k1 || !k2 {
    if k1 && current == 0 {
        result = "1"
        current = 1
    } else {
        result = "3"
    }
    
    // 1번쨰 칸에서 target 까지 이동
    target -= 1
    result += Array(repeating: "3", count: target) // 이미 한칸 내려왔으니까 - 1
    current = target
    if target == goal { // 3으로 바꿔줬으니까
        if goal == 1 {
            k2 = true
        } else {
            k1 = true
            
            target = kbs2
            goal = 1
        }
    } else {
        result += "2" // 한칸 올려서 current를 타겟으로
        current -= 1
        result += Array(repeating: "4", count: target - goal)
        current = goal
        
        if goal == 1 {
            k2 = true
        } else {
            k1 = true
        }
    }
    cicle += 1
}
print(result)
 */

//
//// kbs1 이 아래에있을 때
//if kbs1 > kbs2 {
//    result += (Array(repeating: "3", count: kbs1 - 1).joined() + "1")
//    result += Array(repeating: "4", count: kbs1).joined()
//    var count = kbs2 - 1
//    if count > 0 {
//        result += (Array(repeating: "1", count: count).joined() + "3")
//        count -= 1
//        if count > 0 {
//            result += Array(repeating: "4", count: kbs2 - count).joined()
//        }
//    }
//} else { // KBS1, KBS2 정렬되어 있을 때
//    var adjust = 0
//    var target = kbs1
//    var goal = 0
//    if kbs1 == 0 {
//        result += "1"
//        adjust = 1
//        target = kbs2
//        goal = 1
//    }
//    
//    result += Array(repeating: "3", count: kbs2 - adjust).joined()
//    
//    if target - 1 > goal {
//        result += Array(repeating: "2", count: kbs2 - kbs1 + 1).joined()
//        result += Array(repeating: "4", count: kbs1 - 1).joined()
//    }
//    
//    if kbs2 - 1 > 1 {
//        let count = kbs2 - 1
//        result += Array(repeating: "4", count: count).joined()
//        result += (Array(repeating: "1", count: kbs1) + Array(repeating: "4", count: count - 1))
//    }
//}
//
//print(result)

/**
 
 var adjust = 0
 var target = kbs1
 var goal = 0
 if kbs1 == 0 {
     result += "1"
     adjust = 1
 }
 
 result += Array(repeating: "3", count: kbs2 - adjust).joined()
 
 if kbs1 - 1 > 0 {
     result += Array(repeating: "2", count: kbs2 - kbs1 + 1).joined()
     result += Array(repeating: "4", count: kbs1 - 1).joined()
 }
 
 if kbs2 - 1 > 1 {
     let count = kbs2 - 1
     result += Array(repeating: "4", count: count).joined()
     result += (Array(repeating: "1", count: kbs1) + Array(repeating: "4", count: count - 1))
 }
 */
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
