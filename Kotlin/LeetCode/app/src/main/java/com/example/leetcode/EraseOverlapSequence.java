package com.example.leetcode;

import java.util.ArrayList;

public class EraseOverlapSequence {

    /**
     * 문제 설명
     * 수열 int[] sequence가 주어집니다.
     * 만약 중복된 숫자가 있을 경우 중복되는 숫자를 지우려고 합니다.
     * 중복된 숫자들을 지울때 중복된 숫자 중 인덱스가 가장 높은 숫자만 남기고 나머지를 지웁니다.
     * <p>
     * 위의 규칙대로 중복이 제거된 수열을 리턴하세요.
     * 참고 / 제약 사항
     * sequence의 요소의 개수는 1개 이상 50개 이하 입니다.
     * sequence의 각 요소는 1이상 1,000이하의 정수 입니다.
     * 테스트 케이스
     * int[] sequence = [1,5,5,1,6,1]
     * 리턴(정답): [5,6,1]
     * 가장 우측의 숫자만을 남기고, 나머지 숫자를 지우면 [5, 6, 1]이 됩니다.
     */

    public int[] solution(int[] sequence) {

        ArrayList<Integer> list = new ArrayList<>();

        for (Integer number : sequence) {
            list.remove(Integer.valueOf(number));
            list.add(number);
        }

        int[] ret = new int[list.size()];
        for (int i = 0; i < list.size(); i++) {
            ret[i] = list.get(i);
        }

        return ret;
    }
}
