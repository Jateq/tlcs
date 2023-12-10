clear all;close all;clc;


s = tf('s');

numerator = 1;
denominator = (s+1) * (s^2 + s + 4);
G = numerator / denominator

% Calculate gain margin (GM) and phase margin (PM)
[~, phaseMargin, ~, gainMargin] = margin(G);

% Plot the Bode plot
bode(G);
grid on;


disp(['Phase Margin (PM): ' num2str(phaseMargin) ' degrees']);
disp(['Gain Margin (GM): ' num2str(gainMargin) ' dB']);