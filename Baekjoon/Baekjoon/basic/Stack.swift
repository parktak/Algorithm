//
//  Stack.swift
//  Baekjoon
//
//  Created by 박탁인 on 1/5/26.
//


/**

 2
 5
 3
 3
 -1
 -1
 */
class StackSol {
    func sol() {
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
