package com.example.leetcode;

public class ElectionStrategy {
    /**
    문제 설명
    나라의 대통령 후보가 둘 있습니다.
    이 후보들 중 1번 후보는 자신이 현재 가장 지고 있는 선거구에 가서 마지막 선거 유세를 하려 합니다.

    지지율 조사 결과를 나타내는 vector<string> stats이 주어 집니다.
    vector<string> stats의 각 요소는 선거구를 나타내며, 각 요소는 문자열로 주어집니다.
    문자열은 '1'과 '2'로 구성되어 있는데, '1'은 후보1을 지지하는것을 뜻합니다. '2'는 후보2를 지지하는것을 뜻합니다.

    후보1의 지지율이 가장 낮은 선거구의 인덱스를 리턴하세요.
    만약, 지지율이 가장 낮은곳이 여러곳이라면, 그 중 더 낮은 인덱스를 리턴하세요.

     참고 / 제약 사항
     stats의 각 요소의 개수는 1개 이상, 50개 이하 입니다.
     stats의 각 요소인 문자열의 길이는 1 이상, 50 이하 입니다. 또한, '1'과 '2' 만으로 구성되어 있습니다.
     테스트 케이스
     vector<string> stats = ["1222","1122","1222"]
     리턴(정답): 0
     첫번째 선거구는 25%, 두번째는 50%, 세번째는 25% 이므로, 첫번째 선거구를 선택합니다.
     */

    public int solution(String[] stats){
        float min = 1;
        int ret = 0;

        for(int i = 0 ; i < stats.length; i++) {
            String stat = stats[i];
            char[] prefers = stat.toCharArray();

            int preferOne = 0;
            for(char prefer : prefers) {
                if(prefer == '1') {
                    preferOne++;
                }
            }
            float ratio = (float)preferOne / (float)prefers.length;
            if( min > ratio) {
                min = ratio;
                ret = i;
            }
        }
        return ret;
    }
}
