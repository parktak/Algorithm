package com.example.leetcode

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class MainActivity : AppCompatActivity() {

    val sol = Solution()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        travelRoute()
//        changeWord()
//        network()
//        eraseOverlapSequence()
    }


}
fun MainActivity.travelRoute() {
    val sol = TravelRoute()
    sol.solution(arrayOf(
        arrayOf("ICN","JFK")
        ,arrayOf("HND","IDA")
    ,arrayOf("JFK","HND")
    ))
}

fun MainActivity.changeWord() {
    val sol = ChangeWord()
    sol.solution( "hit", "cog"
        ,arrayOf("dot", "hot", "dog", "log", "lot", "cog"))
}
fun MainActivity.network() {
    val sol = Network()

    val arr = arrayOf(intArrayOf(1,1,0,1),
        intArrayOf(1,1,0,0),
        intArrayOf(0,0,1,1),
        intArrayOf(1,0,1,1)
    )

    val ret = sol.solution(arr.size, arr)
    println(ret)
}

fun MainActivity.findMedianSortedArrays() {
    val first = intArrayOf(1,2)
    val second = intArrayOf(3,4)

    sol.findMedianSortedArrays( first, second )
}

fun MainActivity.lengthOfLongestSubstring() {
    val str = "abcabcb"
    sol.lengthOfLongestSubstring(str)
}
fun MainActivity.targetNumber() {
    val sol = TargetNumber()
    val arr = arrayOf(1,1,1,1,1).toIntArray()
    val ret = sol.solution(arr,3)

    println("targetNumber : $ret")
}
fun MainActivity.thrteen() {
    val sol = Thriteen()

    val ret = sol.solution(200)
    println(ret)
}
fun MainActivity.selfNumber() {
    val sol = SelfNumber()
    val ret = sol.solution(101)
    println(ret)
}
fun MainActivity.sort() {
    val sol = Sort()

    val ret = sol.solution(intArrayOf(115,999,798,221,124,543,77,1000,1,10))

    println(ret)
}
fun MainActivity.stack() {
    val sol = Stack()
    val ret = sol.solution(arrayOf("PUSH 1","PUSH 2","PUSH 3","POP","POP","PUSH 4","POP","PUSH 5"))
}
fun MainActivity.centerPoint() {
    val sol = CenterPoint()

    val ret = sol.solution(1,1,2,1000)
    println(ret)
}
fun MainActivity.electionStrategy() {
    val sol = ElectionStrategy()
    sol.solution(arrayOf("1222111122","2222222111","11111222221222222222"))
}

fun MainActivity.eraseOverlapSequence() {
    val sol = EraseOverlapSequence()
    sol.solution(intArrayOf(2,4,2,4,4))
}