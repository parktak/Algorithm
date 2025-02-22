package com.example.leetcode

import java.util.*

class TargetNumber {

    /**
     * n개의 음이 아닌 정수가 있습니다. 이 수를 적절히 더하거나 빼서 타겟 넘버를 만들려고 합니다. 예를 들어 [1, 1, 1, 1, 1]로 숫자 3을 만들려면 다음 다섯 방법을 쓸 수 있습니다.
        -1+1+1+1+1 = 3
        +1-1+1+1+1 = 3
        +1+1-1+1+1 = 3
        +1+1+1-1+1 = 3
        +1+1+1+1-1 = 3

    사용할 수 있는 숫자가 담긴 배열 numbers, 타겟 넘버 target이 매개변수로 주어질 때 숫자를 적절히 더하고 빼서 타겟 넘버를 만드는 방법의 수를 return 하도록 solution 함수를 작성해주세요.

    제약 조건
    주어지는 숫자의 개수는 2개 이상 20개 이하입니다.
    각 숫자는 1 이상 50 이하인 자연수입니다.
    타겟 넘버는 1 이상 1000 이하인 자연수입니다.

    입출력 예
    numbers	            target	return
    [1, 1, 1, 1, 1]	    3	    5
     */

    /**
     * 개쩌는답
     * fun solution(numbers: IntArray, target: Int): Int {
        return numbers.fold(listOf(0)) { list, i ->
            list.run {
            map { it + i } + map { it - i }
            }
        }.count { it == target }
    }
     */
    fun solution(numbers: IntArray, target: Int): Int {
        var answer = 0


        var current = numbers[0]

        answer += dfs(current, 1, target, numbers)
        answer += dfs(-current, 1, target, numbers)

        return answer
    }

    fun dfs( current : Int, index : Int, target: Int, numbers: IntArray) : Int {

        if( index == numbers.size) {
            return if(current == target) {  1 }
            else { 0 }
        }

        val cur1 = current + numbers[index]
        val cur2 = current - numbers[index]

        var ret : Int

        ret = dfs(cur1, index + 1, target, numbers)
        ret += dfs(cur2, index + 1, target, numbers)

        return ret
    }
}