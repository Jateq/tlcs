clc; clear; close all;

num = [1 1];
den = [1 2 1]; 
G = tf(num, den);
nyquist(G);