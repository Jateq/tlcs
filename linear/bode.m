clear all; close all; clc

% Define the symbolic variable s
s = tf('s');

% Define the transfer function
numerator = 100 * s * (10 * s + 5);
denominator = (30 * s + 5) * (s + 100) * (10 * s + 25);

H = numerator / denominator;

% Display the transfer function
disp('Transfer Function:');
disp(H);

% Plot the Bode plot
bode(H);
