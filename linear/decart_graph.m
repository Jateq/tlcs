clear all;
close all;
clc;

% Define symbolic variables
syms L M

% Define the inequality
inequality = M < (4*L + 2)/(3*L - 1);

% Generate a grid of points for L and M
[L, M] = meshgrid(-10:0.1:10, -10:0.1:10);

% Evaluate the inequality on the grid
Z = eval(inequality);

% Plot the region where the inequality is true
figure;
contourf(L, M, double(Z), [1 1], 'LineColor', 'k', 'LineWidth', 2);
xlabel('L');
ylabel('M');
title('Region where M < (4L + 2)/(3L-1)');
colorbar;

% Add the inequality as a line
hold on;
fimplicit(inequality, 'r', 'LineWidth', 2);
legend('M < (4L + 2)/(3L-1)');
hold off;
