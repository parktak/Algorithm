package com.example.leetcode;

import java.util.Iterator;

public class Stack {

    public int[] solution(String[] cmds){

//        String[] cmds = ["PUSH 1","PUSH 2","PUSH 3","POP","POP","PUSH 4","POP","PUSH 5"]

        java.util.Stack<Integer> stack = new java.util.Stack<>();

        for(String cmd : cmds) {
            if(cmd.contains("PUSH")) {
                String[] split = cmd.split(" ");
                stack.push( Integer.parseInt(split[1]));
            } else {
                if(stack.size() == 0) { continue; }
                stack.pop();
            }
        }


        int[] ret = new int[stack.size()];
        int i = 0;
        for (Iterator<Integer> it = stack.iterator(); it.hasNext(); ) {
            ret[i++] = it.next();
        }
        return ret;

    }

}
