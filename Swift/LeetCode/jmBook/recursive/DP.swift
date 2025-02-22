//
//  DP.swift
//  LeetCode
//
//  Created by 박탁인 on 2022/01/15.
//

import Foundation

class DP {
//    let arrA = [10,20,30,1,2]
//    let arrB = [10,20,30]
    
    let arrA = [1,2,3]
    let arrB = [4,5,6]
    func now() {
        var cache = [[Int]] (repeating: [Int](repeating: -1, count: arrA.count + 1 ), count: arrB.count + 1)
        
        // 전체 순회하기위해 -1에서 시작 
        let ret = jLis(-1, -1, &cache)
        print(ret)
    }
    
    func jLis(_ idxA: Int,_ idxB: Int,_ cache: inout [[Int]]) -> Int {
        
        if cache[idxB + 1][idxA + 1] != -1 {
            return cache[idxB + 1][idxA + 1]
        }
        
        let A = idxA == -1 ? Int.min : arrA[idxA]
        let B = idxB == -1 ? Int.min : arrB[idxB]
        let bigger = max(A, B)
        var ret = 0
        
        for i in idxA + 1 ..< arrA.count {
            if arrA[i] > bigger {
                ret = max(ret, jLis(i, idxB, &cache) + 1)
            }
        }
        
        for j in idxB + 1 ..< arrB.count {
            if arrB[j] > bigger {
                ret = max(ret, jLis(idxA, j, &cache) + 1)
            }
        }
        
        cache[idxB + 1][idxA + 1] = ret
        return ret
    }
}
