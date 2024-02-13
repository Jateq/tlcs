clear all; close; clc; 
% Define the plant transfer function
G = tf([1], [1, 6]); 

% Open pidtool to design the PID controller
pidtool(G);
Kp = 18;
%% closed-loop transfer function
T = feedback(Kp * G, 1);

t = 0:0.01:5; 
step(T, t);   

