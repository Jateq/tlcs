close all; clear; clc; 
G = tf([1], [3, 1]); 


pidtool(G);
Kp = 700;
T = feedback(Kp * G, 1);

t = 0:0.01:5; 
% step(T, t);   

