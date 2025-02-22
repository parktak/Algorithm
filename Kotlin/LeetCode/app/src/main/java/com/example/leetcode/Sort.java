package com.example.leetcode;

import java.util.Stack;

public class Sort {

    class solsol {
        Stack<Integer> stack;
        int origianl;

        public solsol(Stack<Integer> stack, int i) {
            this.stack = stack;
            this.origianl = i;
        }
    }

    public int[] solution(int[] arr){

        // int 15, 143, 167;

        solsol[] sortArr = new solsol[arr.length];
        for(int i = 0; i < arr.length; i++) {

            int temp = arr[i];
            Stack<Integer> stack = new Stack<>();
            while(temp > 0) {
                stack.push(temp%10);
                temp /= 10;
            }
            sortArr[i] = new solsol(stack,arr[i]);
        }


        return sort(sortArr);
    }

    public int[] sort(solsol[] sortArr) {

        int[] ret = new int[sortArr.length];

        for(int i = 0; i < sortArr.length; i++) {
            for(int j = i + 1; j < sortArr.length; j++) {
                Stack<Integer> stack_i = sortArr[i].stack;
                Stack<Integer> stack_j = sortArr[j].stack;
                if(compareStack(stack_i, stack_j)) {

                    solsol temp = sortArr[i];
                    sortArr[i] = sortArr[j];
                    sortArr[j] = temp;
                }
            }
        }

        for(int i = 0; i < sortArr.length; i++) {
            ret[i] = sortArr[i].origianl;
        }

        return ret;
    }

    public boolean compareStack(Stack<Integer> left, Stack<Integer> right) {
        int size = left.size() > right.size() ? right.size() : left.size();

        Stack<Integer> tempA = (Stack<Integer>) left.clone();
        Stack<Integer> tempB = (Stack<Integer>) right.clone();
        for(int c = 0; c < size; c++) {
            int ii = tempA.pop();
            int jj = tempB.pop();
            if( ii > jj) {
                return true;
            } else if( jj > ii) {
                return false;
            } else if( jj == ii && c == size-1) {
                return tempA.size() > tempB.size();
            }
        }

        return false;
    }

}
