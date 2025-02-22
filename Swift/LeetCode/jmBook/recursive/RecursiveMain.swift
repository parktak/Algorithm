//
//  RecursiveMain.swift
//  LeetCode
//
//  Created by 박탁인 on 2022/01/10.
//

import Foundation

class RecursiveMain {
    
    func go() {
//        Recursive().picnick(4, 6, [0,1,1,2,2,3,3,0,0,2,1,3])
        /*
        Recursive().boardCover(8, 10,
//                               ["#.....#",
//                                "#.....#",
//                                "##..###"])
                               ["##########",
                                "#........#",
                                "#........#",
                                "#........#",
                                "#........#",
                                "#........#",
                                "#........#",
                                "##########"])
         */
        
        var arr = [38, 27, 43, 9, 3 ,82, 10]
        var sorted = arr
//        Recursive().mergeSort(&arr, left: 0, right: arr.count - 1, sorted: &sorted)
//        Recursive().fense(left: 0, right: 6, heights: [7,1,5,9,6,7,3])
        DP().now()
        
        print(arr)
    }
}
