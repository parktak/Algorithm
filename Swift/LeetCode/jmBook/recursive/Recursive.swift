//
//  Recursive.swift
//  LeetCode
//
//  Created by 박탁인 on 2022/01/10.
//

import Foundation

class Recursive {
    
    func picnick(_ n: Int, _ m: Int, _ friends: [Int]) {
        var visited = [Bool](repeating: false, count: n)
        var areFriends = [[Bool]](repeating: Array(repeating: false, count: n), count: n)
        for i in stride(from: 0, to: friends.count, by: 2) {
            areFriends[friends[i]][friends[i+1]] = true
            areFriends[friends[i+1]][friends[i]] = true
            print("\(friends[i]), \(friends[i+1])")
        }
//        4 6
//        0 1 / 1 2/  2 3/ 3 0/ 0 2/ 1 3
        var ret = 0
//        for i in 0 ..< n {
            ret += recursivePicnick(n, m, areFriends, &visited)
//        }
        print(ret)
    }
    
    func recursivePicnick(_ n: Int,_ m: Int,_ friends:[[Bool]],_ visited: inout [Bool]) -> Int {
        var ret = 0
        
        var firstFree = -1
        for i in 0 ..< n {
            if !visited[i] {
                firstFree = i
                break
            }
        }
        if firstFree == -1 { return 1 }
        
        
        for j in firstFree + 1 ..< n {
            if friends[firstFree][j] && !visited[j] && !visited[firstFree] {
                visited[firstFree] = true
                visited[j] = true
                ret += recursivePicnick(n, m, friends, &visited)
                
                visited[firstFree] = false
                visited[j] = false
            }
        }
    
        
        return ret
    }

    func boardCover(_ h : Int,_ w : Int,_ tBoard: [String]) {
        
        var board = Array(repeating: Array(repeating: 0, count: w), count: h)
        for i in 0 ..< tBoard.count {
            for (j,c) in tBoard[i].enumerated() {
                board[i][j] = c == "." ? 0 : 1
            }
        }
        
        let ret = recursiveBoardCover(h, w, board: &board)
        print(ret)
        
        
    }
    
    let coverType = [ [[0,0], [1,0], [0,1]],
                       [[0,0], [0,1], [1,1]],
                       [[0,0], [1,0], [1,1]],
                       [[0,0], [1,0], [1,-1]]
                      ]
    func recursiveBoardCover(_ h: Int,_ w: Int, board: inout [[Int]]) -> Int {
        var ret = 0

        var targetX = -1
        var targetY = -1
        for i in 0 ..< h {
            for j in 0 ..< w {
                if board[i][j] == 0 {
                    targetX = j
                    targetY = i
                    break
                }
            }
            if targetX != -1 {
                break
            }
        }
        
        if targetX == -1 { return 1 }
        
        for type in 0 ..< coverType.count {
            if setBoard(x: targetX, y: targetY, board: &board, coverType: type, fill: 1) {
                ret += recursiveBoardCover(h, w, board: &board)
            }
            _ = setBoard(x: targetX, y: targetY, board: &board, coverType: type, fill: -1)
            
        }
        
        return ret
    }
    
    func setBoard(x: Int, y: Int, board: inout [[Int]], coverType:Int, fill: Int) -> Bool {
        
        var ret = true
        
        for i in 0 ..< 3 {
            let x = x + self.coverType[coverType][i][0]
            let y = y + self.coverType[coverType][i][1]
            if x >= board[0].count || x < 0 || y >= board.count || y < 0 {
                ret = false
                continue
            }
            board[y][x] += fill
            if board[y][x] > 1 {
                ret = false
            }
        }
        
        return ret
    }
    
    func mergeSort(_ arr: inout [Int] , left: Int, right: Int, sorted: inout [Int]) {
        
        if left == right { return }
        let mid = (left + right) / 2
        
        mergeSort(&arr, left: left, right: mid, sorted: &sorted)
        mergeSort(&arr, left: mid+1, right: right, sorted: &sorted)
        merge(&arr, left: left, right: right, mid: mid, sorted: &sorted)
        
    }
    
    func merge(_ arr: inout[Int], left: Int, right: Int, mid: Int, sorted: inout [Int]) {
        var i = left
        var j = mid+1
        var k = left
        while( i <= mid && j <= right) {
            print("i -> \(arr[i]), j -> \(arr[j])")
            if arr[i] >= arr[j] {
                
                sorted[k] = arr[j]
                j += 1
            } else {
                
                sorted[k] = arr[i]
                
                i += 1
            }
            k += 1
            print(sorted)
            print(arr)
        }
        
        if i > mid {
            for a in j ... right {
                sorted[k] = arr[a]
                k+=1
            }
        } else {
            for a in i ... mid {
                sorted[k] = arr[a]
                k += 1
            }
        }
        
        print(sorted)
        arr = sorted
    }
    
}

extension Recursive {
    func fense(left: Int, right: Int, heights: [Int]) -> Int {
        
        if left == right { return heights[left] }
        var ret = 0
        let mid = (left + right) / 2
        
        
        let leftWidth = fense(left: left, right: mid, heights: heights)
        let rightWidth = fense(left: mid+1, right: right, heights: heights)
        
        var lo = mid
        var hi = mid + 1
        
        var height = min(heights[lo], heights[hi])
        
        while lo > left && hi < right {
            
            if hi < right && (lo == left || heights[lo-1] < heights[hi + 1]) {
                
                hi += 1
                height = min(heights[hi], height)
                
                
            } else {
                lo -= 1
                height = min(heights[lo], height)
            }
            
            ret = max(ret, height * (hi - lo + 1) )
        }
        
        ret = max(max(leftWidth,rightWidth), ret)
        
        return ret
    }
}
