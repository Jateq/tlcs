clear all;
close all;
clc;

s = tf('s');

numerator = 10;
denominator = s * (s^2 + 0.4*s + 4);
G = numerator / denominator;

% Plot the Bode plot
figure;
bode(G);
grid on;
title('Bode Plot for G(s) = 10 / (s(s^2 + 0.4s + 4))');

%%
% Plot the Nyquist plot
figure;
nyquist(G);
grid on;
title('Nyquist Plot for G(s) = 10 / (s(s^2 + 0.4s + 4))');
