clear all;close all;clc;


s = tf('s');

numerator = 4000;
denominator = s * (s + 40);
G = numerator / denominator

% Calculate gain margin (GM) and phase margin (PM)
[~, phaseMargin, ~, gainMargin] = margin(G);

% Plot the Bode plot
bode(G);
grid on;


disp(['Phase Margin (PM): ' num2str(phaseMargin) ' degrees']);
disp(['Gain Margin (GM): ' num2str(gainMargin) ' dB']);