//
//  Sort.swift
//  Baekjoon
//
//  Created by 박탁인 on 1/5/26.
//



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