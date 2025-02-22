package com.example.leetcode;

public class Thriteen {

    /**
     *
     * 시간 제한 : 2초메모리 제한 : 256MB
     * 문제 설명
     * 정수 int a가 주어집니다.
     * 1이상 int a이하의 정수 중 숫자에 13이 들어가는 숫자의 개수를 리턴하세요.
     * 참고 / 제약 사항
     * a는 1이상, 10,000이하 입니다.
     * 테스트 케이스
     * int val = 13
     * 리턴(정답): 1
     * int val = 200
     * 리턴(정답): 12
     */
    int solution(int val){
        if(val < 13) return 0;
        int count = 0;

        for(int i = 1; i <= val; i++) {

            int a = i;
            int three = 0;
            int one = 0;

            //13
            while(a > 0) {
                one = a % 10;
                if( one == 1 && three == 3) {
                    count++;
                    break;
                }
                three = one;
                a /= 10;
            }
        }

        return count;
    }

}
