clear all;
close all;
clc;

% Define symbolic variables
s = tf('s');

% Define the transfer function G(s)
numerator = 2000 * (s + 0.5);
denominator = s * (s + 10) * (s + 50);
G = numerator / denominator;

% Calculate gain margin (GM) and phase margin (PM)
[~, phaseMargin, ~, gainMargin] = margin(G);

% Plot the Bode plot
bode(G);
grid on;

% Add annotations to the plot
title(['Bode Plot for G(s) = 2000(s + 0.5) / (s(s + 10)(s + 50))', ...
    sprintf('\nPhase Margin (PM): %.2f degrees', phaseMargin), ...
    sprintf('\nGain Margin (GM): %.2f dB', 20 * log10(gainMargin))]);

disp(['Phase Margin (PM): ' num2str(phaseMargin) ' degrees']);
disp(['Gain Margin (GM): ' num2str(gainMargin) ' dB']);