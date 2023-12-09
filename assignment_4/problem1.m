clear all; close all; clc

G = tf([1],[2 1])

% Display the transfer function
disp('Transfer Function:');
disp(G);

% Plot the Bode plot
bode(G);
