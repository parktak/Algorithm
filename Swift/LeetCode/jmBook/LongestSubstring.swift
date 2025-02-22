//
//  LongestSubstring.swift
//  LeetCode
//
//  Created by 박탁인 on 2025/02/22.
//

import Foundation

class LongestSubstring {
    func longestPalindrome(_ s: String) -> String {
        let arr = Array(s)
        var maxLen = 0
        var start = 0
        for i in 0 ..< s.count {
            
            let odd = getMatchedStr(arr, i, i)
            let even = getMatchedStr(arr, i, i+1)
            let maxL = odd.1 > even.1 ? odd : even
            if maxL.1 > maxLen {
                maxLen = maxL.1
                start = maxL.0
            }
        }
        
        return String(arr[start ... start + maxLen])
    }
    
    func getMatchedStr(_ arr: [Character],_ l: Int,_ r: Int) -> (Int,Int) {
        var maxLen = 0
        var left = l
        var right = r
        var start = left
        while(left >= 0 && right < arr.count && arr[left] == arr[right] ) {
            if right - left > maxLen {
                maxLen = right - left
                start = left
            }
            left -= 1
            right += 1
        }
        
        return (start, maxLen)
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
            
            if s.isEmpty { return 0 }
            
            let arr = Array(s)
            
            var substring = ""
        
            var max = 0
            
            for current in 0 ..< arr.count {
                if let s_idx = substring.lastIndex(of: arr[current]) {

                    
    //                let startIdx = substring.index(s_idx, offsetBy: 1)
                    let result = String(substring[s_idx...])
                    
                    if result.count + 1 > max {
                        max = result.count + 1
                    }
                }
                
                substring += String(arr[current])
                
            }
            
            return max
        }
}

