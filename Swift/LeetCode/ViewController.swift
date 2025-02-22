//
//  ViewController.swift
//  LeetCode
//
//  Created by 박탁인 on 2021/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let str = "dvdf"
//        let str = "babad"
//        let str = "pwwkew"
//        let str = "au"
//        var ret = LongestSubstring().longestPalindrome(str)
        
//        var arr = [2,1,1,0,1]
//        var arr = [2,0,2,0]
//        var ret = cote().solution( 2,2,&arr )
        
        
//        var str = "my.song.mp3 11b\ngreatSong.flac 1000b\nnot3.txt 5b\nvideo.mp4 200b\ngame.exe 100b\nmov!e.mkv 10000b"
//        let ret = cote().solution(&str)
        
//        var array = [3,2,-2,5,-3]
//        var array = [1,1,2,-1,2,-1]
//        var array = [1,2,3,-4]
//        let ret = cote().solution(&array)
        
        var A = [2,1]
        var B = [3,3]
//        var A = [1,3,2,1]
//        var B = [4,2,5,3]
        let ret = cote().solution(&B, &A)
        print(ret)
        
//        RecursiveMain().go()
    }


}

class cote {
        
    public func solution(_ A: inout [Int], _ B: inout [Int]) -> Int {
        let n: Int = A.count
        let m: Int = B.count
        A.sort()
        B.sort()
        var k: Int = 0
        var i: Int = 0
        
        while k < n && i < m - 1 {
            if i < m - 1 && B[i] < A[k] {
                i += 1
            }
            if A[k] == B[i] {
                return A[k]
            }
            if B[i] > A[k] {
                k += 1
            }
        }
        return -1
    }
    
    public func solution(_ A : inout [Int]) -> Int {

        let set = Set(A).sorted()
        
        var left = 0
        var right = set.count - 1
        
        while left < right {
            let biggest = set[right]
            let smallest = set[left]
            
            if biggest == -smallest {
                return biggest
                
            } else if biggest > -smallest {
                right -= 1
                
            } else {
                left += 1
            }
        }
        
        return 0
    }
    
    struct FileInformation {
        let type: Extensions
        var size: Int = 0
        var extensionName: String { return type.name }
    }
    
    enum Extensions: Int {
        case music, image, movie, other
        
        var name: String { get {
            switch self {
            case .music: return "music"
            case .image: return "images"
            case .movie: return "movies"
            case .other: return "other"
            }
        }}
        
        static func getExtension(_ fileName: String) -> Extensions {
            let music = [".mp3", ".aac", ".flac"]
            let image = [".jpg", ".bmp", ".gif"]
            let movie = [".mp4", ".avi", ".mkv"]
            if let range = fileName.range(of: ".", options: .backwards) {
                let ex = String(fileName[range.lowerBound...])
                
                return music.contains(ex) ? .music :
                image.contains(ex) ? .image :
                movie.contains(ex) ? .movie : .other
            }
            
            return .other
        }
    }
    
    func getSize(_ size: String) -> Int {
        let ret = Int(size.dropLast())
        return ret == nil ? 0 : ret!
    }
    
    public func solution(_ str : inout String) -> String {
        // write your code in Swift 4.2.1 (Linux)
        let commands = str.components(separatedBy: "\n")
        var extensions = [FileInformation(type: .music, size: 0)
                          ,FileInformation(type: .image)
                          ,FileInformation(type: .movie)
                          ,FileInformation(type: .other)]
        
        commands.forEach {
            let separted = $0.components(separatedBy: " ")
            let ext = Extensions.getExtension(separted[0])
            let size = getSize(separted[1])
            
            extensions[ext.rawValue].size += size
        }
        
        return extensions.map { "\($0.extensionName) \($0.size)b"}.joined(separator: "\n")
    }
    
    
    public func solution(_ U : Int, _ L : Int, _ C : inout [Int]) -> String {
        // write your code in Swift 4.2.1 (Linux)
        
        var upperArray = [Int]()
        var lowerArray = [Int]()
        let ret = getCombination(U, L, C, 0, &upperArray, &lowerArray)
        
        return ret == nil ? "IMPOSSIBLE" : ret!
    }
    
    func getCombination(_ U: Int,_ L: Int,_ C : [Int],_ current: Int,_ upper: inout [Int],_ lower: inout [Int]) -> String? {
        
        if current == C.count {
            let upperSum = upper.reduce(0, +)
            let lowerSum = lower.reduce(0, +)
            if U == upperSum && L == lowerSum {
                let upperS = upper.map{String($0)}.joined(separator: "")
                let lowerS = lower.map{String($0)}.joined(separator: "")
                return "\(upperS),\(lowerS)"
            }
            return nil
        }
        
        var ret: String?
        if C[current] == 2 {
            upper.append(1)
            lower.append(1)
            ret = getCombination(U, L, C, current+1,&upper,&lower)
            
        } else if C[current] == 0 {
            upper.append(0)
            lower.append(0)
            ret = getCombination(U, L, C, current+1,&upper,&lower)
            
        } else {
            upper.append(1)
            lower.append(0)
            let uRet = getCombination(U, L, C, current+1,&upper,&lower)
            upper.removeLast()
            lower.removeLast()
            
            upper.append(0)
            lower.append(1)
            let lRet = getCombination(U, L, C, current+1,&upper,&lower)
            upper.removeLast()
            lower.removeLast()
            ret = uRet == nil ? lRet : uRet
        }
        
        return ret
    }
}
