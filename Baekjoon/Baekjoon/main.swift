//
//  main.swift
//  Baekjoon
//
//  Created by 박탁인 on 2025/12/23.
//

//import Foundation
/**

 2
 5
 3
 3
 -1
 -1
 */
//let input = Int(readLine()!)!
let n = Int(readLine()!)!
var stack = Stack<Int>()

for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map { Int($0)!}
    let command = input[0]
    if command == 1 {
        stack.push(input[1])
    } else if command == 2 {
        print(stack.removeLast() ?? -1)
    } else if command == 3 {
        print(stack.count)
    } else if command == 4 {
        print( stack.isEmpty() ? 1 : 0)
    } else {
        print(stack.getLast() ?? -1)
    }
}

class Stack<T>  where T: Hashable {
    private (set) var stack = [T]()
    private(set) var count = 0
    func push(_ value: T) {
        stack.append(value)
        count += 1
    }
    
    func removeLast() -> T? {
        if count == 0 {
            return nil
        }
        let last = stack[count - 1]
        stack.remove(at: count - 1)
        count -= 1
        return last
    }
    
    func isEmpty() -> Bool {
        count == 0
    }
    
    func getLast() -> T? {
        if count == 0 {
            return nil
        }
        let last = stack[count - 1]
        return last
    }
}

class Sort {
    
    func sol() {
        /**
         문제
         2022 연세대학교 미래캠퍼스 슬기로운 코딩생활에 $N$명의 학생들이 응시했다.

         이들 중 점수가 가장 높은 $k$명은 상을 받을 것이다. 이 때, 상을 받는 커트라인이 몇 점인지 구하라.

         커트라인이란 상을 받는 사람들 중 점수가 가장 가장 낮은 사람의 점수를 말한다.

         입력
         첫째 줄에는 응시자의 수 $N$과 상을 받는 사람의 수 $k$가 공백을 사이에 두고 주어진다.

         둘째 줄에는 각 학생의 점수 $x$가 공백을 사이에 두고 주어진다.

         출력
         상을 받는 커트라인을 출력하라.


         */
        let input = readLine()!.split(separator: " ").map { Int($0)!}
        //let input = "5 2".split(separator: " ").map { Int($0)!}
        let n = input[0]
        let k = input[1]

        var numbers = readLine()!.split(separator: " ").map { Int($0)!}
        //var numbers = "100 76 85 93 98".split(separator: " ").map { Int($0)!}

        func qsort(_ array: inout [Int], start: Int, end: Int) {
            if start >= end {
                return
            }
            
            let pivot = array[(start + end) / 2]
            var left = start
            var right = end
            
            while left < right {
                while array[right] > pivot {
                    right -= 1
                }
                while array[left] < pivot {
                    left += 1
                }
                if left <= right {
                    array.swapAt(left, right)
                    left += 1
                    right -= 1
                }
            }
            qsort(&array, start: start, end: right)
            qsort(&array, start: left , end: end)
        }

        qsort(&numbers, start: 0, end: n - 1)

        print(numbers[n-k])
    }
    // pivot = start
    func qsort2(_ array: inout [Int], start: Int, end: Int) {
        if start >= end {
            return
        }
        let pivot = array[start]
        var left = start + 1
        var right = end
        
        while true {
            while left <= right && array[right] >= pivot  { right -= 1 }
            while left <= right && array[left] <= pivot { left += 1 }
            
            if left > right {
                break
            }
            array.swapAt(left, right)
            
        }
        array.swapAt(start, right)
        
        qsort(&array, start: start, end: right - 1)
        qsort(&array, start: right + 1, end: end)
    }
    
    // pivot = mid
    func qsort(_ array: inout [Int], start: Int, end: Int) {
        if start >= end { return }

        let pivot = array[(start + end) / 2]
        var left = start
        var right = end

        while left <= right {
            while array[left] < pivot { left += 1 }
            while array[right] > pivot { right -= 1 }

            if left <= right {
                array.swapAt(left, right)
                left += 1
                right -= 1
            }
        }

        qsort(&array, start: start, end: right)
        qsort(&array, start: left, end: end)
    }

//    qsort(&numbers, start: 0, end: numbers.count - 1)
//    numbers.forEach { print($0)}



    func mergeSort() {
        var numbers = [Int]()
        let n = 5
        func mergeSort(_ array : inout [Int], start: Int, end: Int) {
            if start >= end {
                return
            }
            
            let mid = (start + end) / 2
            
            mergeSort(&array, start: start, end: mid)
            mergeSort(&array, start: mid + 1, end: end)
            
            merge(&array, start: start, mid: mid, end: end)
        }

        func merge(_ array: inout [Int], start: Int, mid: Int, end: Int) {
            
            var _start = start
            var _mid = mid + 1
            var result = [Int]()
            
            while _start <= mid && _mid <= end {
                if array[_start] < array[_mid] {
                    result.append(array[_start])
                    _start += 1
                } else {
                    result.append(array[_mid])
                    _mid += 1
                }
            }
            while _start <= mid {
                result.append(array[_start])
                _start += 1
            }
            while _mid <= end {
                result.append(array[_mid])
                _mid += 1
            }
            
            var copy = 0
            print("start -> \(start) : end -> \(end) | array ->\(result)")
            for i in start ... end {
                array[i] = result[copy]
                copy += 1
            }
        }

        mergeSort(&numbers, start: 0, end: n - 1)

        print(numbers)
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
