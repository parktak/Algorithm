package com.example.leetcode

class Solution {


    /**
     * https://leetcode.com/problems/median-of-two-sorted-arrays/
     * Input: nums1 = [1,3], nums2 = [2]
     * Output: 2.00000
     * Explanation: merged array = [1,2,3] and median is 2.
     *
     * Runtime: 284 ms, faster than 69.19% of Kotlin online submissions for Median of Two Sorted Arrays.
     * Memory Usage: 46.2 MB, less than 5.69% of Kotlin online submissions for Median of Two Sorted Arrays.
     */


    fun findMedianSortedArrays(nums1: IntArray, nums2: IntArray): Double {

        val mergeArray = nums1 + nums2
        mergeArray.sort()

        var median = mergeArray.size / 2


        if(mergeArray.size % 2 == 0) {
            val first = mergeArray[median-1].toDouble()
            val second = mergeArray[median].toDouble()
            return (first + second) / 2
        } else {
            return mergeArray[median].toDouble()
        }
    }


    //    https://leetcode.com/problems/longest-substring-without-repeating-characters/
    //포기 ㅎㅎ 
    fun lengthOfLongestSubstring(s: String): Int {

        //abcabcb
        //pwwkew

        var hitCount = 0
        var findRepeat = false
        val repeatArray = ArrayList<Char>()
        s.forEach { c ->

            if(findRepeat) {
                return@forEach
            }

            var isRepeat = false
            //find repeat char
            repeatArray.forEach{
                if(it == c) {
                    isRepeat = true
                }
            }

            if(isRepeat) {
                hitCount++
            } else {
                if(hitCount > 0) {
                    //repeat stop
                    findRepeat = true
                } else {
                    repeatArray.clear()
                }
            }

            repeatArray.add(c)
        }

        return repeatArray.count()
    }


    fun search(s: String, start : Int, end : Int) : Boolean {

        val set = s.toHashSet()
        for( i in start..end) {
            val c = s[i]
            if(set.contains(c))
                return true
        }
        return false
    }
}


