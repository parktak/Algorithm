package com.example.leetcode;

public class CalculateAccount {

    /**
     *
     은행 전산실에서 일을 하고 있습니다.

     고객 계좌의 전날 잔액 int balance가 주어집니다.
     고객이 할 수 있는 거래는 두가지 입니다.
     1. 입금(계좌에 금액 입금)
     2. 출금(계좌에서 금액 출금, 신용 거래가 가능한 계좌이기 때문에 마이너스도 가능 합니다.)

     입금은 "C 거래금액" 으로 나타내고, 출금은 "D 거래금액" 으로 나타냅니다.(자세한 사항은 예제를 참조하세요.)
     오늘의 거래내역 String[] transactions가 주어질때, 최종 잔액을 리턴하세요.
     참고 / 제약 사항
     balance는 0 이상 1,000,000 이하 입니다.
     transactions 의 요소의 개수는 0개 이상, 50개 이하 입니다.
     transactions의 각 요소는 입금: "C 거래금액", 출금: "D 거래금액" 이며, 문자열 입니다.
     거래금액은 1 이상 1,000,000 이하 입니다.
     테스트 케이스
     int balance = 100
     String[] transactions = ["C 1000","D 500","D 350"]
     리턴(정답): 250
     */

    public int solution(int balance, String[] transactions){
        int ret = balance;
        for(String transaction : transactions) {
            int translatedAmount = Integer.parseInt(transaction.split(" ")[1]);
            ret += transaction.contains("C") ? translatedAmount : (translatedAmount * -1);
        }
        return ret;
    }
}
