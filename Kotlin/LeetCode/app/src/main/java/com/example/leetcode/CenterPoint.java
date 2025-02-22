package com.example.leetcode;

public class CenterPoint {

    /**

    문제 설명
    직선상에 2개의 고정된 물체가 있습니다.
    첫번째 물체는 int x1위치에 존재하며, int m1의 질량을 가지며, 두번째 물체는 int x2위치에 존재하며, int m2의 질량을 가집니다.

    이 두개의 고정된 물체 사이에 임의의 물체를 놓게 되면,
    이 물체는 왼쪽과 오른쪽 물체에서 각각 힘을 받게 됩니다.

    서로 떨어진 두개의 물체사이에 작용하는 힘은 만유인력의 법칙 G * m1 * m2 / r^2 로 정의됩니다.
    이때 m1, m2는 각 물체의 질량, r은 두 물체 사이의 거리, G는 중력 상수입니다.

    두 물체 사이에 존재하는 무수한 위치 중, 왼쪽 물체에서 작용하는 힘과, 오른쪽 물체에서 작용하는 힘이 같아지는 지점을 평형점이라고 합니다.

    평형점을 리턴하세요.

     */
    public double solution(int x1, int m1, int x2, int m2){


        if(!isVaild(x1) || !isVaild(m1) || !isVaild(x2) || !isVaild(m2)) { return 0.0; }
//        x1, x2는 1이상, 10,000이하의 정수 입니다.
//                m1, m2는 1이상, 10,000이하의 정수 입니다.

        double center = ((Math.sqrt(m1) * x2) + (Math.sqrt(m2) * m1)) / (Math.sqrt(m2) + Math.sqrt(m1));

        return center;
    }

    boolean isVaild(int val) {
        return val > 1 && val <= 10000;
    }
}
