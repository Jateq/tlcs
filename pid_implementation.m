clear all; clc; close all;

%Plant tf
G_p = tf(1.2,[0.36 1.86 2.5 0]);

%% Tuned PID coefficients using Ziegler Nichols second method
Kp = 18;
Ki = 12.8;
Kd = 6.3;
G_c = tf([6.3 18 12.8], [1 0]);
G_ff = G_p * G_c;

G_closed_loop = feedback(G_ff,1);
%compare the behaviors
figure();
subplot 211
step(G_p) % original plant without  controller
subplot 212
step(G_closed_loop)