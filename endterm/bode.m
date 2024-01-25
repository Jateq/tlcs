clear all;
close all;
clc;

s = tf('s');

numerator = 25;
denominator = s * (2.5* s^2 + s + 10);
G = numerator / denominator;

% Plot the Bode plot
figure;
bode(G);
grid on;
title('Bode Plot for G(s) = 25 / (s(s^2 + s + 10))');
