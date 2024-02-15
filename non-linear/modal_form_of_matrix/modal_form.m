clear; close all; clc;

A = [-2 1; 2 -3]; B = [1;2]; C = [2 1];

[L, q_dot] = modal_sys(A,B,C);

disp(vpa(q_dot,2))