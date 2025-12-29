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

class TV {
    
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
    func use14Sol() {
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
    }
    
    func use3Sol() {
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

        var cursor = 0
        while kbs1 > 0 {
            if array[cursor] == "KBS1" {
                array.swapAt(cursor, cursor - 1)
                cursor -= 1
                kbs1 -= 1
                result.append("4")
            } else {
                array.swapAt(cursor, cursor + 1)
                result.append("3")
                cursor += 1
                if array[cursor - 1] == "KBS1" {
                    if cursor - 1 > 0 {
                        result.append("2")
                        cursor -= 1
                    }
                    kbs1 -= 1
                }
            }
            
        }

        while kbs2 > 1 {
            if array[cursor] == "KBS1" {
                if array[cursor + 1] == "KBS2" {
                    kbs2 -= 1
                } else {
                    cursor += 1
                    result.append("1")
                }
            } else if array[cursor] == "KBS2" {
                array.swapAt(cursor, cursor - 1)
                cursor -= 1
                kbs2 -= 1
                result.append("4")
            } else {
                array.swapAt(cursor, cursor + 1)
                
                result.append("3")
                cursor += 1
                if array[cursor - 1] == "KBS2" {
                    if cursor - 1 > 1  {
                        result.append("2")
                        cursor -= 1
                    }
                    
                    kbs2 -= 1
                }
            }
            
        }
        print(result)
    }
}
