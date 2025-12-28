//
//  IT.swift
//  Baekjoon
//
//  Created by 박탁인 on 2025/12/27.
//

import Foundation

class ZOAC4 {
    
    /**
     2021년 12월, 네 번째로 개최된 ZOAC의 오프닝을 맡은 성우는 오프라인 대회를 대비하여 강의실을 예약하려고 한다.

     강의실에서 대회를 치르려면 거리두기 수칙을 지켜야 한다!

     한 명씩 앉을 수 있는 테이블이 행마다 W개씩 H행에 걸쳐 있을 때, 모든 참가자는 세로로 N칸 또는 가로로 M칸 이상 비우고 앉아야 한다. 즉, 다른 모든 참가자와 세로줄 번호의 차가 N보다 크거나 가로줄 번호의 차가 M보다 큰 곳에만 앉을 수 있다.

     논문과 과제에 시달리는 성우를 위해 강의실이 거리두기 수칙을 지키면서 최대 몇 명을 수용할 수 있는지 구해보자.
     H, W, N, M이 공백으로 구분되어 주어진다. (0 < H, W, N, M ≤ 50,000)
     */
    
    func sol() {
        
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let H = input[0]
        let W = input[1]
        let N = input[2]
        let M = input[3]

        print(((H + N) / (N + 1)) * ((W + M) / (M + 1)))
    }
    
    func firstSol() {
        let input = readLine()!.split(separator: " ")
        let H = Int(input[0])!
        let W = Int(input[1])!
        let N = Int(input[2])!
        let M = Int(input[3])!
        var max = 0
        for n in stride(from: 0, to: H, by: N + 1) {
            for m in stride(from: 0, to: W, by: M + 1) {
                max += 1
            }
        }

        print(max)
         
    }
}

class Triangle5073 {
    
    /**
     삼각형의 세 변의 길이가 주어질 때 변의 길이에 따라 다음과 같이 정의한다.

     Equilateral :  세 변의 길이가 모두 같은 경우
     Isosceles : 두 변의 길이만 같은 경우
     Scalene : 세 변의 길이가 모두 다른 경우
     단 주어진 세 변의 길이가 삼각형의 조건을 만족하지 못하는 경우에는 "Invalid" 를 출력한다. 예를 들어 6, 3, 2가 이 경우에 해당한다. 가장 긴 변의 길이보다 나머지 두 변의 길이의 합이 길지 않으면 삼각형의 조건을 만족하지 못한다.

     세 변의 길이가 주어질 때 위 정의에 따른 결과를 출력하시오.
     */


    func firstSol() {
        
        while true {
            let input = readLine()!.split(separator: " ").map { Int($0)!}.sorted()
            if input[0] == 0 && input[1] == 0 && input[2] == 0 {
                break
            }
            
            if input[2] >= input[0] + input[1] {
                print("Invalid")
                continue
            }
            
            if input[0] == input[1] && input[0] == input[2] {
                print("Equilateral")
            } else if input[0] != input[1] && input[1] != input[2] && input[0] != input[2] {
                print("Scalene")
            } else {
                print("Isosceles")
            }
        }
    }
    
    func secondSol() {
        
        while true {
            let input = readLine()!.split(separator: " ").map { Int($0)!}.sorted()
            if input[0] == 0 && input[1] == 0 && input[2] == 0 {
                break
            }
            if input[2] >= input[0] + input[1] {
                print("Invalid")
                continue
            }
            let set = Set(input)
            switch set.count {
            case 1: print("Equilateral")
            case 2: print("Isosceles")
            case 3: print("Scalene")
            default: break
            }
        }
    }
}

class Bee {
    func sol() {
        
        /**
         위의 그림과 같이 육각형으로 이루어진 벌집이 있다. 그림에서 보는 바와 같이 중앙의 방 1부터 시작해서 이웃하는 방에 돌아가면서 1씩 증가하는 번호를 주소로 매길 수 있다. 숫자 N이 주어졌을 때, 벌집의 중앙 1에서 N번 방까지 최소 개수의 방을 지나서 갈 때 몇 개의 방을 지나가는지(시작과 끝을 포함하여)를 계산하는 프로그램을 작성하시오. 예를 들면, 13까지는 3개, 58까지는 5개를 지난다.

         입력
         첫째 줄에 N(1 ≤ N ≤ 1,000,000,000)이 주어진다.

         출력
         입력으로 주어진 방까지 최소 개수의 방을 지나서 갈 때 몇 개의 방을 지나는지 출력한다.
         세 변의 길이가 주어질 때 위 정의에 따른 결과를 출력하시오.
         */

        var current = Int(readLine()!)!
        var count = 1 // 본인
        current -= 1
        while current > 6 {
            current = current - (6 * count)
            count += 1
        }

        if current > 0 {
            count += 1
        }
        print(count)

    }
}
