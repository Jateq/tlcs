clear all;
close all;
clc;

s = tf('s');

numerator = 10 * (s + 4);
denominator = s * (s + 1) * (s^2 + 25*s + 5);
G = numerator / denominator;

% Plot the Bode plot
figure;
bode(G);
grid on;

% Calculate phase margin (PM) and gain margin (GM) manually
[mag, phase, w] = bode(G);
[~, index] = max(mag);
phaseMargin = phase(index) - (-180);
gainMargin = 1 / mag(index);

% Display phase margin (PM) and gain margin (GM) in the console
disp(['Phase Margin (PM): ' num2str(phaseMargin) ' degrees']);
disp(['Gain Margin (GM): ' num2str(20 * log10(gainMargin)) ' dB']);
