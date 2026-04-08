//
//  main.swift
//  Baekjoon
//
//  Created by 박탁인 on 2025/12/23.
//

//import Foundation
//let input = Int(readLine()!)!

import Foundation
//let l1 = ListNode(2, ListNode(4, ListNode(3)))
//let l2 = ListNode(5, ListNode(6, ListNode(4)))
//
//let sol = Solution().addTwoNumbers(l1, l2)

//let ar = [[0,1,-1],[1,-2,3],[2,-3,4]]
//let sol = Solution().maximumAmount(ar)

let str = "PAYPALISHIRING"
let n = 3
let sol = Solution()
//    .convert(str, n)
//    .removeKdigits("1432219", 3)
    .letterCombinations("23")

print("\(sol)")


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let dict: [Character: [Character]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]]
        let charArray : [Character] = Array(digits)
            var result = [String]()
        
        func dfs(_ current: inout String, index: Int ) {
            if index == digits.count {
                result.append(current)
                return
            }
            
            let array = dict[charArray[index]]
            for char in array! {
                current.append(char)
                dfs(&current, index: index + 1 )
                current.removeLast()
            }
            
        }
        if digits.isEmpty {
            return []
        }
        var buffer = ""
        dfs(&buffer, index: 0)
        return result
    }
    
    func removeKdigits(_ num: String, _ k: Int) -> String {
        
        var k = k
        var stack = [Character]()
        
        for digit in num {
            while k > 0 && !stack.isEmpty, stack.last! > digit {
                stack.removeLast()
                k -= 1
            }
            stack.append(digit)
        }
        
        while k > 0 && !stack.isEmpty {
            stack.removeLast()
            k -= 1
        }
        
        while stack.first == "0" {
            stack.removeFirst()
        }
        
        if stack.isEmpty {
            return "0"
        }
        
        return String(stack)
    }
    
    
    func convert(_ s: String, _ numRows: Int) -> String {
        
        var converted = ""
        var array = Array(repeating: [String](),count: numRows)
        
        for (index, char) in s.enumerated() {
            
            array[index % numRows].append("\(char)")
        }
        for i in 0 ..< numRows {
            var index = i
            let nextRow = (numRows * 2) - ((i + 1) * 2)
            while index < s.count {
          
                let strIndex = s.index(s.startIndex, offsetBy: index )
                converted += "\(s[strIndex])"
                //PAHN A PLSIIGYIR
                index += nextRow
            }
        }
        
        return converted
    }


    func maximumAmount(_ coins: [[Int]]) -> Int {
        let n = coins.count
        let m = coins[0].count
        
        let NEG = Int.min / 4
        
        // dp[y][x][k]
        var dp = Array(
            repeating: Array(
                repeating: Array(repeating: NEG, count: 3),
                count: m
            ),
            count: n
        )
        
        // 시작점 초기화
        let start = coins[0][0]
        dp[0][0][0] = start
        
        if start < 0 {
            dp[0][0][1] = 0   // neutralize 1번 사용
        }
        
        for y in 0..<n {
            for x in 0..<m {
                if x == 0 && y == 0 { continue }
                
                let coin = coins[y][x]
                
                for k in 0...2 {
                    var bestPrev = NEG
                    
                    if x > 0 {
                        bestPrev = max(bestPrev, dp[y][x-1][k])
                    }
                    if y > 0 {
                        bestPrev = max(bestPrev, dp[y-1][x][k])
                    }
                    
                    if bestPrev == NEG { continue }
                    
                    // 1) 그냥 먹기
                    dp[y][x][k] = max(dp[y][x][k], bestPrev + coin)
                    
                    // 2) neutralize (coin이 음수일 때만)
                    if coin < 0 && k < 2 {
                        dp[y][x][k+1] = max(dp[y][x][k+1], bestPrev)
                    }
                }
            }
        }
        
        return max(dp[n-1][m-1][0], dp[n-1][m-1][1], dp[n-1][m-1][2])
    }
    
//    func maximumAmount(_ coins: [[Int]]) -> Int {
//        
//        let m = coins.first?.count ?? 0
//        let n = coins.count
//
//        if !(1 <= m && n <= 500) {
//            return 0
//        }
//        
//        var max = -Int.max
//        
//        
//        func dfs(_ x: Int, y: Int, total: Int, neturalize: [Int]) {
//            var newNeturalize = neturalize
//            
//            let coin = coins[y][x]
////            print("x : \(x), y : \(y) coin -> \(coin)")
//            
//            
//            if coin < 0 {
//                if neturalize[0] > coin {
//                    if neturalize[1] > coin {
//                        newNeturalize[0] = neturalize[1]
//                        newNeturalize[1] = coin
//                    } else {
//                        newNeturalize[0] = coin
//                    }
//                }
//            }
//            
//            if x == m - 1 && y == n - 1 {
//                let newTotal = total + ((newNeturalize[0] + newNeturalize[1]) * -1) + coin
//                if max < newTotal {
//                    
//                    max = newTotal
//                }
//                return
//            }
//            
//            
//            if x < m - 1 {
//                dfs(x + 1, y: y, total: total + coin, neturalize: newNeturalize)
//            }
//            
//            if y < n - 1 {
//                dfs(x, y: y + 1, total: total + coin, neturalize: newNeturalize)
//            }
//            
//        }
//        dfs(0, y: 0, total: 0, neturalize: Array(repeating: 0, count: 2))
//
//        return max
//            
//
//    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        let dummy = ListNode(0)
        var current = dummy

        
        var list1 = l1
        var list2 = l2
        
        var carry = 0
        
        while list1 != nil || list2 != nil || carry != 0 {
            let x = list1?.val ?? 0
            let y = list2?.val ?? 0
            var sum = x + y + carry
            
            carry = sum / 10
            sum %= 10
            
            current.next = ListNode(sum)
            current = current.next!
            
            list1 = list1?.next
            list2 = list2?.next
        }
        
        return dummy.next
        
    }
}



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
