clear all;
close all;
clc;

G = tf([4],[1 1 4]);

% Plot the Bode plot
bode(G);
grid on;

% Calculate and display the gain and phase margins
[GM, PM] = margin(G);

% Display the gain and phase margins in the console
disp(['Phase Margin (PM): ' num2str(PM) ' degrees']);
disp(['Gain Margin (GM): ' num2str(GM)]);
